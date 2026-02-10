#!/bin/bash

# Rocky Linux 10 Dell Optimization Script
# Usage: sudo ./optimize-rocky.sh

set -e

echo "Starting Rocky Linux 10 Dell optimization..."

# 1. Fix sda transfer size alignment
echo "Optimizing disk I/O for sda..."
echo 4096 > /sys/block/sda/queue/optimal_io_size
echo 4096 > /sys/block/sda/queue/minimum_io_size

# Make persistent
cat > /etc/udev/rules.d/60-sda-optimization.rules << EOF
ACTION=="add|change", KERNEL=="sda", ATTR{queue/optimal_io_size}="4096"
ACTION=="add|change", KERNEL=="sda", ATTR{queue/minimum_io_size}="4096"
EOF

udevadm control --reload-rules
udevadm trigger

# 2. Stop and remove OLLAMA
echo "Removing OLLAMA services..."
systemctl stop ollama 2>/dev/null || true
systemctl disable ollama 2>/dev/null || true

# Remove OLLAMA files
rm -rf /usr/local/bin/ollama
rm -rf /usr/share/ollama
rm -rf ~/.ollama
rm -rf /var/lib/ollama
rm -f /etc/systemd/system/ollama.service
rm -f /usr/lib/systemd/system/ollama.service

systemctl daemon-reload

echo "✓ Optimization completed"
echo "✓ sda transfer size set to 4096-byte alignment"
echo "✓ OLLAMA services stopped and removed"