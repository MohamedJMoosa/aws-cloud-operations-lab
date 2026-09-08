#!/bin/bash

echo "===== SERVER HEALTH REPORT ====="
echo "Date: $(date)"
echo

echo "=== UPTIME ==="
uptime
echo

echo "=== CPU LOAD ==="
top -bn1 | grep "Cpu(s)"
echo

echo "=== MEMORY ==="
free -h
echo

echo "=== DISK USAGE ==="
df -h /
echo

echo "=== NGINX STATUS ==="
if systemctl is-active --quiet nginx; then
    echo "Nginx: RUNNING"
else
    echo "Nginx: DOWN"
fi
echo

echo "=== WEBSITE STATUS ==="
if curl -s --max-time 5 http://localhost > /dev/null; then
    echo "Website: ACCESSIBLE"
else
    echo "Website: NOT ACCESSIBLE"
fi

echo
echo "===== END OF REPORT ====="


