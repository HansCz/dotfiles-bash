# load prompt
source $BASH/lib/ps1.bash
ps1_set

# load git autocompletion
. $BASH/lib/git-completion.bash

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

if [[ "$OSNAME" == "$DEFAULT_OSNAME" && "$HOSTNAME" == "$DEFAULT_HOSTNAME" ]] 
then
  eval `ssh-agent` >/dev/null
fi
