#!/bin/bash

# Variables
APP_DIR="/path/to/your/app"
GIT_REPO="https://github.com/yourusername/yourrepo.git"
BRANCH="main"
TEST_COMMAND="your_test_command"  # e.g., "pytest" or "npm test"
BUILD_COMMAND="your_build_command"  # e.g., "npm run build" or "make"
RESTART_COMMAND="your_restart_command"  # e.g., "pm2 restart app_name" or "systemctl restart your_service"

# Navigate to the application directory
cd $APP_DIR || { echo "Directory not found"; exit 1; }

# Pull the latest changes
echo "Pulling the latest code from $GIT_REPO..."
git checkout $BRANCH
git pull origin $BRANCH

# Install dependencies
echo "Installing dependencies..."
your_dependency_manager install  # e.g., "npm install", "pip install -r requirements.txt"

# Run tests
echo "Running tests..."
$TEST_COMMAND
if [ $? -ne 0 ]; then
    echo "Tests failed. Deployment aborted."
    exit 1
fi

# Build the application (optional)
if [ -n "$BUILD_COMMAND" ]; then
    echo "Building the application..."
    $BUILD_COMMAND
fi

# Restart the application
echo "Restarting the application..."
$RESTART_COMMAND
echo "Deployment completed successfully!"


# Instructions
# Update Variables: Modify the APP_DIR, GIT_REPO, BRANCH, TEST_COMMAND, BUILD_COMMAND, RESTART_COMMAND, and dependency manager commands as needed.
# Make Script Executable: Run chmod +x deploy.sh to make the script executable.
# Run the Script: Execute the script with ./deploy.sh.
