# SudoAskPass

A graphical sudo password prompt application for FreeBSD using GNUstep.

## Description

SudoAskPass provides a graphical interface for sudo password prompts, compatible with the SUDO_ASKPASS environment variable. This application is built using GNUstep and is designed to work on FreeBSD systems.

## Features

- Clean, simple graphical interface
- Secure password input field
- Support for keyboard shortcuts (Enter for OK, Escape for Cancel)
- Floating window that stays on top
- Compatible with sudo's SUDO_ASKPASS mechanism

## Building

### Prerequisites

- GNUstep development environment
- GNUstep Base and GUI libraries

### Build Instructions

1. Source the GNUstep environment:
   ```
   source /usr/local/share/GNUstep/Makefiles/GNUstep.sh
   ```

2. Build the application:
   ```
   make
   ```

3. Install the application:
   ```
   make install
   ```

## Usage

### As SUDO_ASKPASS

Set the SUDO_ASKPASS environment variable to point to the SudoAskPass binary:

```bash
export SUDO_ASKPASS=/usr/local/bin/SudoAskPass
sudo -A your-command
```

### Direct Usage

You can also run SudoAskPass directly to test the password dialog:

```bash
/usr/local/bin/SudoAskPass
```

## Installation

The application installs to `/usr/local/bin/SudoAskPass` by default when using `make install`.

## License

This software is provided as-is for educational and practical purposes.

## Author

Created for FreeBSD systems using GNUstep.
