#!/bin/bash

echo "===== SERVER HEALTH CHECK ====="
echo "Date: $(date)"
echo

echo "===== LOAD ====="
uptime

echo
echo "===== MEMORY ====="
free -h

echo
echo "===== DISK ====="
df -h /

echo
echo "===== NGINX STATUS ====="

if systemctl is-active --quiet nginx; then
    echo "Nginx: OK - Running"
else
    echo "Nginx: WARNING - Not Running"
fi

echo
echo "===== WEBSITE STATUS ====="

HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" http://localhost)

if [ "$HTTP_CODE" -eq 200 ]; then
    echo "Website: OK - HTTP $HTTP_CODE"
else
    echo "Website: WARNING - HTTP $HTTP_CODE"
fi
