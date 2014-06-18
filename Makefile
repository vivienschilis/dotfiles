LIST = irbrc pryrc tmux.conf rvmrc ackrc  gitconfig bashrc jshint.json ctags inputrc gitignore_global zshrc zshenv

default: update

link: $(LIST)
	for f in $(LIST) ; do ln -fvs ~/.DotFiles/$$f ~/.$$f; done

unlink: $(LIST)
	@for f in $(LIST) ; do rm ~/.$$f; done

private:
	git clone git@github.com:vivienschilis/private-configs.git ~/.private

update:
	git pull -r -u origin master

safe-update:
	git stash || make update || git stash pop

setup : link update private
