#!/bin/bash

# Variables
APP_DIR="/path/to/your/static/files"
GIT_REPO="https://github.com/yourusername/yourrepo.git"
BRANCH="main"
NGINX_CONF="/etc/nginx/sites-available/your_site"
NGINX_LINK="/etc/nginx/sites-enabled/your_site"

# Navigate to the application directory
cd $APP_DIR || { echo "Directory not found"; exit 1; }

# Pull the latest changes
echo "Pulling the latest code from $GIT_REPO..."
git checkout $BRANCH
git pull origin $BRANCH

# Optionally, build the static site if needed
# echo "Building the static site..."
# your_build_command  # e.g., if using a static site generator

# Copy files to the web server directory
echo "Copying files to the web server directory..."
cp -r $APP_DIR/* /var/www/html/  # Adjust target directory as needed

# Check if Nginx configuration exists
if [ ! -f "$NGINX_CONF" ]; then
    echo "Creating Nginx configuration..."
    cat <<EOL > $NGINX_CONF
server {
    listen 80;
    server_name your_domain.com;  # Change to your domain

    location / {
        root /var/www/html;  # Adjust to your web root
        index index.html;
        try_files \$uri \$uri/ =404;
    }
}
EOL
    ln -s $NGINX_CONF $NGINX_LINK
fi

# Restart Nginx to apply changes
echo "Restarting Nginx..."
systemctl restart nginx

echo "Deployment completed successfully!"


# Instructions
# Update Variables: Modify the APP_DIR, GIT_REPO, BRANCH, and Nginx configuration paths to match your setup.
# Make Script Executable: Run chmod +x deploy_static_site.sh to make the script executable.
# Run the Script: Execute the script with ./deploy_static_site.sh.