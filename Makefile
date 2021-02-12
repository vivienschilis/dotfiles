all: sync

sync:

	[ -f ~/.config/fish/config.fish ] || ln -s $(PWD)/fish ~/.config/fish
	[ -f ~/.config/git/config ] || ln -s $(PWD)/git ~/.config/git
	[ -f ~/.config/vim/vimrc ] || ln -s $(PWD)/vim ~/.config/vim
	[ -f ~/.config/tmux/tmux.conf ] || ln -s $(PWD)/tmux ~/.config/tmux
	[ -f ~/.ignore ] || ln -s $(PWD)/ignore ~/.ignore

clean:
	rm -f ~/.config/vim
	rm -f ~/.config/fish
	rm -f ~/.config/git
	rm -f ~/.config/tmux
	rm -f ~/.ignore

.PHONY: all clean sync 
