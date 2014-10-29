default: vundle link install

link:
	ln -f -s ~/.DotFiles/vim/ ~/.vim
	ln -f -s ~/.DotFiles/vim/vimrc ~/.vimrc

vundle:
	git clone https://github.com/gmarik/vundle.git bundle/vundle || true

install:
	vim +PluginInstall +qall
