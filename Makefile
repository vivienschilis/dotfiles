all: sync

sync:

	[ -f ~/.config/fish/config.fish ] || ln -s $(PWD)/fish ~/.config/fish
	[ -f ~/.config/git/config ] || ln -s $(PWD)/git ~/.config/git
	[ -f ~/.vimrc ] || ln -s $(PWD)/vimrc ~/.vimrc
	[ -f ~/.tmux.conf ] || ln -s $(PWD)/tmux.conf ~/.tmux.conf
	[ -f ~/.ignore ] || ln -s $(PWD)/ignore ~/.ignore

clean:
	rm -f ~/.vimrc 
	rm -rf ~/.config/fish
	rm -rf ~/.config/git/
	rm -f ~/.tmux.conf
	rm -f ~/.ignore

.PHONY: all clean sync 
