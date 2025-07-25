#!/bin/sh

# Test script for SudoAskPass
echo "Testing SudoAskPass application..."

# Set the SUDO_ASKPASS environment variable
export SUDO_ASKPASS=$(readlink -f SudoAskPass.app/SudoAskPass)

echo "SUDO_ASKPASS set to: $SUDO_ASKPASS"
echo ""
echo "Testing with environment variable set manually:"
echo "SUDO_COMMAND='ls -la /' $SUDO_ASKPASS"
echo ""
echo "Now testing with actual sudo:"
sudo -A ls -la /