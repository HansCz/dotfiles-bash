# Get the names of the current operating system and the host
OSNAME=`uname`
HOSTNAME=`hostname`

# Path to my bash configuration.
BASH=$HOME/bin/dotfiles/bash

# set the default username and hostname
# these will be omitted from prompt
DEFAULT_OSNAME="Darwin"
DEFAULT_USERNAME="hans"
DEFAULT_HOSTNAME="brahma.local"

source "$BASH/bash-init.bash"