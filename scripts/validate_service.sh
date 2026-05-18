#!/bin/bash
set -e
echo "=== ValidateService ==="

sleep 3

# Check nginx is running
if systemctl is-active --quiet nginx; then
  echo "✅ nginx is running"
else
  echo "❌ nginx is NOT running"
  systemctl status nginx --no-pager -l
  exit 1
fi

# Check HTTP 200 response
HTTP_STATUS=$(curl -s -o /dev/null -w "%{http_code}" http://localhost/)
if [ "$HTTP_STATUS" = "200" ]; then
  echo "✅ App responds with HTTP 200"
else
  echo "❌ App returned HTTP $HTTP_STATUS (expected 200)"
  exit 1
fi

echo "=== ValidateService passed — deployment successful! ==="
