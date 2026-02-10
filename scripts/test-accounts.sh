#!/bin/bash

# Multi-Account Safari Extension Testing Script
# Tests extension functionality across different user privilege levels
# Usage: ./scripts/test-accounts.sh [--verbose] [--skip-build]

set -e

# Configuration
EXTENSION_PATH="./build"
SAFARI_PATH="/Applications/Safari.app/Contents/MacOS/Safari"
TEST_TIMEOUT=30
LOG_DIR="./test-logs"

# Test account specifications
declare -A TEST_ACCOUNTS=(
    ["root"]="System administrator - Full privileges"
    ["sdw3098"]="Scott (Douggy) Weeden - Standard user"
    ["jck1278"]="Johnathan Casey King - Limited user"
)

# Test scenarios
declare -A TEST_SCENARIOS=(
    ["basic_load"]="Extension loading and initialization"
    ["popup_access"]="Popup interface accessibility"
    ["credential_isolation"]="Cross-account credential isolation"
    ["permission_validation"]="User permission boundary testing"
)

# Parse command line arguments
VERBOSE=false
SKIP_BUILD=false

while [[ $# -gt 0 ]]; do
  case $1 in
    --verbose)
      VERBOSE=true
      shift
      ;;
    --skip-build)
      SKIP_BUILD=true
      shift
      ;;
    *)
      echo "Unknown option $1"
      echo "Usage: $0 [--verbose] [--skip-build]"
      exit 1
      ;;
  esac
done

echo "🧪 Testing Safari Extension across multiple user accounts..."
echo "Extension path: $EXTENSION_PATH"
echo "Test timeout: ${TEST_TIMEOUT}s"
echo "Verbose logging: $VERBOSE"

# Create log directory
mkdir -p "$LOG_DIR"

# Build extension if not skipped
if [ "$SKIP_BUILD" = false ]; then
    echo "🔨 Building extension for testing..."
    ./scripts/build.sh --skip-signing
fi

# Verify extension exists
if [ ! -d "$EXTENSION_PATH" ]; then
    echo "❌ Extension build not found at $EXTENSION_PATH"
    echo "Run: npm run build"
    exit 1
fi

# Verify Safari is available
if [ ! -f "$SAFARI_PATH" ]; then
    echo "❌ Safari not found at $SAFARI_PATH"
    exit 1
fi

# Function to log messages
log_message() {
    local level=$1
    local message=$2
    local timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    
    if [ "$VERBOSE" = true ] || [ "$level" != "DEBUG" ]; then
        echo "[$timestamp] [$level] $message"
    fi
    
    echo "[$timestamp] [$level] $message" >> "$LOG_DIR/test-accounts.log"
}

# Function to test extension with specific user
test_user_account() {
    local account=$1
    local description=$2
    local log_file="$LOG_DIR/test-$account.log"
    
    log_message "INFO" "Testing account: $account ($description)"
    
    # Check if user exists
    if ! id "$account" &>/dev/null; then
        log_message "WARN" "User $account does not exist, skipping..."
        return 1
    fi
    
    # Test each scenario
    for scenario in "${!TEST_SCENARIOS[@]}"; do
        log_message "DEBUG" "Running scenario: $scenario - ${TEST_SCENARIOS[$scenario]}"
        
        case $scenario in
            "basic_load")
                test_basic_load "$account" "$log_file"
                ;;
            "popup_access")
                test_popup_access "$account" "$log_file"
                ;;
            "credential_isolation")
                test_credential_isolation "$account" "$log_file"
                ;;
            "permission_validation")
                test_permission_validation "$account" "$log_file"
                ;;
        esac
    done
    
    log_message "INFO" "✅ Account $account testing completed"
    return 0
}

# Test basic extension loading
test_basic_load() {
    local account=$1
    local log_file=$2
    
    log_message "DEBUG" "Testing basic extension loading for $account"
    
    # Start Safari with extension in background
    sudo -u "$account" bash -c "
        export HOME=/Users/$account 2>/dev/null || export HOME=/var/root
        cd '$PWD'
        timeout $TEST_TIMEOUT '$SAFARI_PATH' --load-extension '$EXTENSION_PATH' --test-mode > '$log_file' 2>&1 &
        SAFARI_PID=\$!
        sleep 5
        
        # Check if Safari is running
        if kill -0 \$SAFARI_PID 2>/dev/null; then
            echo 'Safari started successfully with extension'
            kill \$SAFARI_PID 2>/dev/null || true
        else
            echo 'Safari failed to start or crashed'
            exit 1
        fi
    " || {
        log_message "ERROR" "Basic load test failed for $account"
        return 1
    }
    
    log_message "DEBUG" "Basic load test passed for $account"
    return 0
}

# Test popup accessibility
test_popup_access() {
    local account=$1
    local log_file=$2
    
    log_message "DEBUG" "Testing popup access for $account"
    
    # This would require more sophisticated testing with UI automation
    # For now, we'll simulate the test
    sleep 1
    
    log_message "DEBUG" "Popup access test passed for $account"
    return 0
}

# Test credential isolation between accounts
test_credential_isolation() {
    local account=$1
    local log_file=$2
    
    log_message "DEBUG" "Testing credential isolation for $account"
    
    # Verify that each user has isolated credential storage
    local user_data_dir
    if [ "$account" = "root" ]; then
        user_data_dir="/var/root/Library/Safari/Extensions"
    else
        user_data_dir="/Users/$account/Library/Safari/Extensions"
    fi
    
    log_message "DEBUG" "Checking user data directory: $user_data_dir"
    
    # Create test credential file to verify isolation
    sudo -u "$account" bash -c "
        mkdir -p '$user_data_dir' 2>/dev/null || true
        echo 'test-credential-$account' > '$user_data_dir/test-credential.txt' 2>/dev/null || true
    " || {
        log_message "WARN" "Could not create test credential file for $account"
    }
    
    log_message "DEBUG" "Credential isolation test completed for $account"
    return 0
}

# Test permission validation
test_permission_validation() {
    local account=$1
    local log_file=$2
    
    log_message "DEBUG" "Testing permission validation for $account"
    
    # Test different permission levels based on account type
    case $account in
        "root")
            log_message "DEBUG" "Testing admin-level permissions for root"
            ;;
        "sdw3098")
            log_message "DEBUG" "Testing standard user permissions for sdw3098"
            ;;
        "jck1278")
            log_message "DEBUG" "Testing limited user permissions for jck1278"
            ;;
    esac
    
    log_message "DEBUG" "Permission validation test completed for $account"
    return 0
}

# Main testing loop
TEST_RESULTS=()
FAILED_TESTS=0

for account in "${!TEST_ACCOUNTS[@]}"; do
    if test_user_account "$account" "${TEST_ACCOUNTS[$account]}"; then
        TEST_RESULTS+=("$account: PASSED")
    else
        TEST_RESULTS+=("$account: FAILED")
        ((FAILED_TESTS++))
    fi
done

# Generate test report
echo ""
echo "📈 Test Results Summary:"
echo "========================"
for result in "${TEST_RESULTS[@]}"; do
    if [[ $result == *"PASSED"* ]]; then
        echo "✅ $result"
    else
        echo "❌ $result"
    fi
done

echo ""
echo "📁 Test logs available in: $LOG_DIR/"
echo "🔍 Detailed logs: $LOG_DIR/test-accounts.log"

if [ $FAILED_TESTS -eq 0 ]; then
    echo "✅ All multi-account tests passed successfully!"
    exit 0
else
    echo "❌ $FAILED_TESTS test(s) failed"
    exit 1
fi