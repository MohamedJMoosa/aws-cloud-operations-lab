#!/bin/bash

BUCKET_NAME="cloud-ops-lab-mohamed-2026"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
REPORT_FILE="server-health-$TIMESTAMP.txt"

{
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
} | tee "$REPORT_FILE"

echo
echo "Uploading report to S3..."

aws s3 cp "$REPORT_FILE" "s3://$BUCKET_NAME/health-reports/$REPORT_FILE"

if [ $? -eq 0 ]; then
    echo "Upload successful."
else
    echo "Upload failed."
fi
