run: pull link 

link:
	ln -f -s ~/.DotFiles/vim/ ~/.vim
	ln -f -s ~/.DotFiles/vim/vimrc ~/.vimrc

update: pull install
	echo "Update done"

pull:
	git clone https://github.com/gmarik/vundle.git bundle/vundle || true
	git stash
	git pull -r -u origin master
	git stash pop || true

install:
	vim +PluginInstall +qall
