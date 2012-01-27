# Note to self: this file only loads if it's an interactive prompt, otherwise, it loads bashrc

if [[ -f ~/.bashrc ]]; then
	source ~/.bashrc
fi
[[ -s "/Users/hans/.rvm/scripts/rvm" ]] && source "/Users/hans/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
