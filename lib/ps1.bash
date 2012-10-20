function ps1_set () {
  local prompt_char='∴'
  local separator="\n"

  if [[ $UID -eq 0 ]] ; then
    prompt_char='#'
  fi

  while [[ $# -gt 0 ]]; do
    token="$1" ; shift

    case "$token" in
      --trace)
        export PS4='+[${BASH_SOURCE}] : ${LINENO} : ${FUNCNAME[0]:+${FUNCNAME[0]}() $ }'
        if [[ -o xtrace ]] ; then
          set +x
        else
          set -x
        fi
        shopt -o xtrace
        ;;
      --prompt)
        prompt_char="$1"
        ;;
      --separator)
        separator="$1"
        ;;
      *)
        true
        ;;
    esac
  done

  PS1="\n$(ps1_identity)$(ps1_host)$(ps1_working_directory)\$(ps1_git)\$(ps1_rvm)${separator}${prompt_char} "
}

function ps1_working_directory () {
  printf "\033[38;5;26m\w\033[0m"
  return 0
}

function ps1_identity () {

  local homefront_username='hans'

  if [[ $UID -eq 0 ]] ; then
    printf "\033[38;5;160m\u\033[0m"
  else
    if [[ $USER != $homefront_username ]]; then
      printf "\033[38;5;240m$USER@\033[0m"
    fi
  fi
  return 0
}

function ps1_host () {

  local homefront_host='brahma.local'

  if [[ $homefront_host != `hostname` ]]; then
    printf "\033[38;5;240m`hostname`:\033[0m"
  fi
  return 0
}

ps1_rvm()
{
  if command -v rvm-prompt >/dev/null 2>/dev/null ; then
    printf " $(rvm-prompt) "
  fi
}

function ps1_git () {
  local branch=""
  local line=""
  local git_prompt="ß"

  shopt -s extglob

  if ! command -v git >/dev/null 2>&1 ; then
    printf "\033[38;5;160m[git not found]\033[0m"
    exit 0
  fi
  while read -r line
  do
    case "${line}" in
      [[=*=]][[:space:]]*)
        branch="${line/[[=*=]][[:space:]]/}"
        ;;
    esac
  done < <(git branch 2>/dev/null)

  if [[ ${branch} ]] ; then

    printf " "

    local git_status="`git status`"
    local git_status_numeric=0

    if [[ "${git_status}" =~ '# Untracked files:' ]] ; then
      printf "\033[38;5;37m·\033[0m"
      let "git_status_numeric+=8"
    fi

    if [[ "${git_status}" =~ '# Changes not staged for commit:' ]] ; then
      printf "\033[38;5;136m·\033[0m"
      let "git_status_numeric+=4"
    fi

    if [[ "${git_status}" =~ '# Changes to be committed:' ]] ; then
      printf "\033[38;5;166m•\033[0m"
      let "git_status_numeric+=2"
    fi

    if [[ "${git_status}" =~ 'nothing to commit (working directory clean)' ]] ; then
      let "git_status_numeric+=1"
    fi

    case $git_status_numeric in
      1)
        printf "\033[38;5;33m${git_prompt}\033[0m \033[38;5;33m${branch}\033[0m"
        ;;
      2|6|10|14)
        printf "\033[38;5;166m${git_prompt}\033[0m \033[38;5;166m${branch}\033[0m"
        ;;
      4|12)
        printf "\033[38;5;136m${git_prompt}\033[0m \033[38;5;136m${branch}\033[0m"
        ;;
      8)
        printf "\033[38;5;37m${git_prompt}\033[0m \033[38;5;37m${branch}\033[0m"
        ;;

    esac

  fi
}
