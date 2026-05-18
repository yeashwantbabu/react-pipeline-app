#!/bin/bash
set -e
echo "=== AfterInstall ==="

# Write nginx config — handles React SPA client-side routing
cat > /etc/nginx/conf.d/react-app.conf << 'EOF'
server {
    listen 80 default_server;
    listen [::]:80 default_server;
    root /var/www/html;
    index index.html;
    server_name _;

    # React SPA — all unknown routes serve index.html
    location / {
        try_files $uri $uri/ /index.html;
    }

    # Cache static assets aggressively
    location ~* \.(js|css|png|jpg|jpeg|gif|ico|svg|woff|woff2|ttf|eot)$ {
        expires 1y;
        add_header Cache-Control "public, immutable";
    }
}
EOF

# Remove default nginx config if present
rm -f /etc/nginx/conf.d/default.conf

# Set correct ownership
chown -R nginx:nginx /var/www/html/
chmod -R 755 /var/www/html/

# Test nginx config before restarting
nginx -t

echo "=== AfterInstall done ==="
