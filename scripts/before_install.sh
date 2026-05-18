#!/bin/bash
set -e
echo "=== BeforeInstall ==="

# Install nginx if missing (Amazon Linux 2023 uses dnf)
if ! command -v nginx &>/dev/null; then
  echo "Installing nginx..."
  dnf install -y nginx
fi

# Ensure web root exists
mkdir -p /var/www/html

# Clean previous deployment
echo "Cleaning /var/www/html/ ..."
rm -rf /var/www/html/*

echo "=== BeforeInstall done ==="
