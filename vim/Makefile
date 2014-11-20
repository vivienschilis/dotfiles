default: vundle link install

link:
	ln -f -s ${DOTFILES_DIR}/vim/ ~/.vim
	ln -f -s $(DOTFILES_DIR)/vim/vimrc ~/.vimrc

vundle:
	git clone https://github.com/gmarik/vundle.git $(DOTFILES_DIR)/vim/bundle/vundle || true

install:
	vim +PluginInstall +qall
