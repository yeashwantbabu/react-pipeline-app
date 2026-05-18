#!/bin/bash
set -e
echo "=== ApplicationStart ==="

systemctl enable nginx
systemctl restart nginx

echo "Nginx status:"
systemctl status nginx --no-pager -l

echo "=== ApplicationStart done ==="
