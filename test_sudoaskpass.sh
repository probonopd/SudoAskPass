#!/bin/sh

# Test script for SudoAskPass
echo "Testing SudoAskPass application..."

# Set the SUDO_ASKPASS environment variable
export SUDO_ASKPASS=$(readlink -f SudoAskPass.app/SudoAskPass)

sudo -A ls -la /