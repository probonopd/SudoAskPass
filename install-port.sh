#!/bin/sh

# FreeBSD Port Installation Script for SudoAskPass
# This script helps install the port into the FreeBSD ports tree

PORTS_DIR="/usr/ports"
PORT_CATEGORY="security"
PORT_NAME="sudoaskpass"
SOURCE_DIR="/home/User/SudoAskPass"

echo "FreeBSD Port Installation Script for SudoAskPass"
echo "================================================="

# Check if running as root
if [ "$(id -u)" -ne 0 ]; then
    echo "This script should be run as root to install into the ports tree."
    echo "Usage: sudo $0"
    exit 1
fi

# Check if ports tree exists
if [ ! -d "$PORTS_DIR" ]; then
    echo "Error: FreeBSD ports tree not found at $PORTS_DIR"
    echo "Please install the ports tree first."
    exit 1
fi

# Create port directory
PORT_DIR="$PORTS_DIR/$PORT_CATEGORY/$PORT_NAME"
echo "Creating port directory: $PORT_DIR"
mkdir -p "$PORT_DIR"

# Copy port files
echo "Copying port files..."
cp "$SOURCE_DIR/freebsd-port/security/sudoaskpass/Makefile" "$PORT_DIR/"
cp "$SOURCE_DIR/freebsd-port/security/sudoaskpass/pkg-descr" "$PORT_DIR/"
cp "$SOURCE_DIR/freebsd-port/security/sudoaskpass/distinfo" "$PORT_DIR/"

# Create source archive
echo "Creating source archive..."
cd "$SOURCE_DIR"
tar -czf sudoaskpass-v1.0.tar.gz main.m GNUmakefile Info.plist README.md LICENSE

echo "Port installation completed!"
echo ""
echo "Next steps:"
echo "1. Update the distinfo file with correct checksums:"
echo "   cd $PORT_DIR && make makesum"
echo "2. Test the port:"
echo "   cd $PORT_DIR && make"
echo "3. Install the port:"
echo "   cd $PORT_DIR && make install"
echo ""
echo "Note: You may need to adjust the MASTER_SITES in the Makefile"
echo "to point to where your source archive is hosted."
