if [[ "$OSNAME" == "$DEFAULT_OSNAME" && "$HOSTNAME" == "$DEFAULT_HOSTNAME" ]] 
then
  # MacVim alias
  alias m='mvim'
  
  # ST2 alias
  alias subl='/Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl'

  # Easier reloading of zshell environment for development
  alias src="source $BASH/bashrc.bash"

  # To prevent slowdown from humongous logs
  alias nukelog='sudo rm -rf /private/var/log/asl/*.asl'

  # Starting and stopping postgres as installed by homebrew
  alias pgstart='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
  alias pgstop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'
fi


# Git
if [[ `command -v git` ]]; then
  alias gst='git status'
  alias gd='git diff'
  alias gdc='git diff --cached'
  alias gl='git lol'
  alias gll='git l'  
fi

# builtins
alias ls='ls -G'
alias ..='cd ..'
alias ...='cd $OLDPWD'

# Miscellaneous shortcuts
alias hg='history | grep '