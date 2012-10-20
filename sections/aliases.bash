# Git aliases
alias gst='git status'
alias gdiff='git diff'
alias gcommit='git commit -v -a'
alias glog='git l'

# builtin aliases
alias ls='ls -G'
alias ..='cd ..'
alias ...='cd $OLDPWD'

# Miscellaneous shortcuts

alias hg='history | grep '

alias vmux="ssh vishnu -t tmux a"
alias src='source ~/bin/util/ps1/ps1.bash;ps1_set'

alias nukelog='sudo rm -rf /private/var/log/asl/*.asl'

alias pgstart='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pgstop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'