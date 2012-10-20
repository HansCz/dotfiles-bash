if [[ `uname` == "Darwin" ]]; then
  eval `ssh-agent` >/dev/null
fi

# load prompt
source ~/bin/util/ps1/ps1.bash
ps1_set

# load git autocompletion
. ~/bin/util/git-completion/git-completion.bash

# autolist a dir when you cd
cd() { builtin cd "$1"; ls -G; }

# rake autocompletion
export COMP_WORDBREAKS=${COMP_WORDBREAKS/\:/}

_rakecomplete() {
  COMPREPLY=($(compgen -W "`rake -s -T | awk '{{print $2}}'`" -- ${COMP_WORDS[COMP_CWORD]}))
  return 0
}
complete -o default -o nospace -F _rakecomplete rake

# autocomplete from ~/.ssh/config and /etc/hosts
complete -W "$(cat ~/.ssh/config | awk '/Host / {print $2}';cat /etc/hosts | awk '$1 != "#" {print $2}')" ssh

# load up rvm
[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm

# Insure autojump (brew distribution) works
if [ -f `brew --prefix`/etc/autojump ]; then
  . `brew --prefix`/etc/autojump
fi