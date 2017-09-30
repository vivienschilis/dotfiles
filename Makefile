.PHONY: vim

LIST = irbrc pryrc tmux.conf ackrc gitconfig gitignore_global zshrc zshenv aliases
DOTFILES_DIR = "${HOME}/.dotfiles"

default: setup

link: $(LIST)
	for f in $(LIST) ; do ln -fs ${DOTFILES_DIR}/$$f ~/.$$f; done

unlink: $(LIST)
	@for f in $(LIST) ; do rm ~/.$$f; done

private:
	git clone git@github.com:vivienschilis/private-configs.git ~/.private

update:
	git pull -r -u origin master

safe-update:
	git stash || make update || git stash pop

ohmyzsh:
	git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

setup : link update

vim:
	$(MAKE) -f ${DOTFILES_DIR}/vim/Makefile DOTFILES_DIR=${DOTFILES_DIR}
