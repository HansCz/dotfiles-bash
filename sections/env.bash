# Add /usr/local and friends (taken from: http://hivelogic.com/articles/compiling-git-on-snow-leopard/)
export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:$PATH"


# Set default editor
export EDITOR="mate -w"

# Share history file across sessions
unset HISTFILESIZE
export PROMPT_COMMAND="history -a;$PROMPT_COMMAND"
shopt -s histappend

# only register unique entries in history file
export HISTIGNORE="&"

export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/1.5.0/Home

# Make Node pick up libs
export NODE_PATH=/usr/local/lib/node