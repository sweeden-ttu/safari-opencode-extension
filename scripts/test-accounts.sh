#!/bin/bash

# Test Safari Extension across multiple user accounts
# Usage: ./scripts/test-accounts.sh

set -e

EXTENSION_PATH="./build/safari-extension.appex"
TEST_ACCOUNTS=("root" "sdw3098" "jck1278")

echo "Testing Safari Extension across user accounts..."

for account in "${TEST_ACCOUNTS[@]}"; do
    echo "Testing with account: $account"
    
    # Check if user exists
    if ! id "$account" &>/dev/null; then
        echo "Warning: User $account does not exist, skipping..."
        continue
    fi
    
    # Test extension loading
    sudo -u "$account" bash -c "
        export HOME=/Users/$account
        /Applications/Safari.app/Contents/MacOS/Safari --load-extension '$EXTENSION_PATH' --test-mode &
        sleep 5
        pkill Safari
    "
    
    echo "✓ Account $account test completed"
done

echo "All account tests completed successfully"