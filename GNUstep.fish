# GNUstep.fish - Fish shell version of GNUstep.sh

# Set GNUSTEP_SYSTEM_ROOT
set -gx GNUSTEP_SYSTEM_ROOT /usr/local/GNUstep/System

# Set GNUSTEP_LOCAL_ROOT
set -gx GNUSTEP_LOCAL_ROOT /usr/local/GNUstep/Local

# Set GNUSTEP_NETWORK_ROOT
set -gx GNUSTEP_NETWORK_ROOT /usr/local/GNUstep/Network

# Set GNUSTEP_USER_ROOT
if not set -q GNUSTEP_USER_ROOT
    set -gx GNUSTEP_USER_ROOT $HOME/GNUstep
end

# Set GNUSTEP_MAKEFILES
set -gx GNUSTEP_MAKEFILES /usr/local/GNUstep/System/Library/Makefiles

# Set PATH
set -gx PATH /usr/local/GNUstep/System/Tools /usr/local/GNUstep/Local/Tools /usr/local/GNUstep/Network/Tools $PATH

# Set LD_LIBRARY_PATH
if set -q LD_LIBRARY_PATH
    set -gx LD_LIBRARY_PATH /usr/local/GNUstep/System/Library/Libraries /usr/local/GNUstep/Local/Library/Libraries /usr/local/GNUstep/Network/Library/Libraries $LD_LIBRARY_PATH
else
    set -gx LD_LIBRARY_PATH /usr/local/GNUstep/System/Library/Libraries /usr/local/GNUstep/Local/Library/Libraries /usr/local/GNUstep/Network/Library/Libraries
end

# Set DYLD_LIBRARY_PATH for macOS (optional, safe to include)
if set -q DYLD_LIBRARY_PATH
    set -gx DYLD_LIBRARY_PATH /usr/local/GNUstep/System/Library/Libraries /usr/local/GNUstep/Local/Library/Libraries /usr/local/GNUstep/Network/Library/Libraries $DYLD_LIBRARY_PATH
else
    set -gx DYLD_LIBRARY_PATH /usr/local/GNUstep/System/Library/Libraries /usr/local/GNUstep/Local/Library/Libraries /usr/local/GNUstep/Network/Library/Libraries
end

# Set GNUSTEP_PATHLIST
set -gx GNUSTEP_PATHLIST /usr/local/GNUstep/System:/usr/local/GNUstep/Local:/usr/local/GNUstep/Network

# Set additional environment variables as needed by your system...