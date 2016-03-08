default: link install

link:
	ln -f -s ${DOTFILES_DIR}/vim/ ~/.vim
	ln -f -s $(DOTFILES_DIR)/vim/vimrc ~/.vimrc

install:
	vim +PlugInstall +qall
