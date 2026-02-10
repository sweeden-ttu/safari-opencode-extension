# Rocky Linux 10 Dell Optimization Plan

## Disk I/O Optimization (sda transfer size)

### Current Issue
Transfer size not aligned to 4096-byte boundaries, causing performance degradation.

### Fix Commands
```bash
# Check current settings
cat /sys/block/sda/queue/physical_block_size
cat /sys/block/sda/queue/logical_block_size

# Set optimal transfer size (4096 alignment)
echo 4096 > /sys/block/sda/queue/optimal_io_size
echo 4096 > /sys/block/sda/queue/minimum_io_size

# Make persistent
echo 'ACTION=="add|change", KERNEL=="sda", ATTR{queue/optimal_io_size}="4096"' > /etc/udev/rules.d/60-sda-optimization.rules
echo 'ACTION=="add|change", KERNEL=="sda", ATTR{queue/minimum_io_size}="4096"' >> /etc/udev/rules.d/60-sda-optimization.rules

# Reload udev rules
udevadm control --reload-rules
udevadm trigger
```

## OLLAMA Removal

### Stop Services
```bash
# Stop OLLAMA services
systemctl stop ollama
systemctl disable ollama

# Check for related services
systemctl list-units --type=service | grep -i ollama
systemctl stop ollama-*
systemctl disable ollama-*
```

### Remove OLLAMA
```bash
# Remove OLLAMA binary and data
rm -rf /usr/local/bin/ollama
rm -rf /usr/share/ollama
rm -rf ~/.ollama
rm -rf /var/lib/ollama

# Remove systemd service files
rm -f /etc/systemd/system/ollama.service
rm -f /usr/lib/systemd/system/ollama.service

# Reload systemd
systemctl daemon-reload
```

### Verification
```bash
# Verify removal
which ollama
systemctl status ollama
systemctl list-units | grep ollama
```