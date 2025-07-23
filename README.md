# SudoAskPass

A graphical sudo password prompt application for FreeBSD using GNUstep.

<img width="410" height="184" alt="image" src="https://github.com/user-attachments/assets/8766a606-af6c-4296-8e45-691cc3172bed" />

## Description

SudoAskPass provides a graphical interface for sudo password prompts, compatible with the SUDO_ASKPASS environment variable. This application is built using GNUstep and is designed to work on FreeBSD systems.

## Features

- Clean, simple graphical interface
- Secure password input field
- Support for keyboard shortcuts (Enter for OK, Escape for Cancel)
- Floating window that stays on top
- Compatible with sudo's SUDO_ASKPASS mechanism
- Details button to show/hide the command being executed (from SUDO_COMMAND environment variable)
- Scrollable command display for long commands

## Building

### Prerequisites

- GNUstep development environment
- GNUstep Base and GUI libraries


## Usage

### As SUDO_ASKPASS

Set the SUDO_ASKPASS environment variable to point to the SudoAskPass binary:

```bash
export SUDO_ASKPASS=/usr/local/bin/SudoAskPass.app/SudoAskPass
sudo -A your-command
```

## Testing

A test script is provided to help verify the functionality:

```bash
./test_sudoaskpass.sh
```

This will set up the environment and provide instructions for testing with sudo.

## Installation

The application installs to `/usr/local/bin/SudoAskPass` by default when using `make install`.
