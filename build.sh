#!/bin/sh

# Build script for SudoAskPass
# This script builds the GNUstep application

echo "Building SudoAskPass..."

# Check if GNUstep is available
if ! command -v gnustep-config >/dev/null 2>&1; then
    echo "Error: GNUstep not found. Please install GNUstep development environment."
    echo "On FreeBSD, install with: pkg install gnustep-make gnustep-base gnustep-gui"
    exit 1
fi

# Source GNUstep environment
if [ -f "/usr/local/share/GNUstep/Makefiles/GNUstep.sh" ]; then
    echo "Sourcing GNUstep environment..."
    . /usr/local/share/GNUstep/Makefiles/GNUstep.sh
else
    echo "Error: GNUstep.sh not found. Please check your GNUstep installation."
    exit 1
fi

# Clean previous builds
echo "Cleaning previous builds..."
make clean

# Build the application
echo "Building application..."
make

if [ $? -eq 0 ]; then
    echo "Build successful!"
    echo "You can now run: make install"
    echo "Or test the application with: ./obj/SudoAskPass"
else
    echo "Build failed!"
    exit 1
fi
