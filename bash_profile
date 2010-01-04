# Note to self: this file only loads if it's an interactive prompt, otherwise, it loads bashrc

if [[ -f ~/.bashrc ]]; then
	source ~/.bashrc
fi