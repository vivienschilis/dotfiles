all: sync

sync:

	[ -f ~/.config/fish/config.fish ] || ln -s $(PWD)/fish ~/.config/fish
	[ -f ~/.config/git/config ] || ln -s $(PWD)/git ~/.config/git
	[ -f ~/.config/tmux/tmux.conf ] || ln -s $(PWD)/tmux ~/.config/tmux
	[ -f ~/.vimrc ] || ln -s $(PWD)/vimrc ~/.vimrc
	[ -f ~/.ignore ] || ln -s $(PWD)/ignore ~/.ignore

clean:
	rm -f ~/.vimrc 
	rm -f ~/.config/fish
	rm -f ~/.config/git
	rm -f ~/.config/tmux
	rm -f ~/.ignore

.PHONY: all clean sync 
