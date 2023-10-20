.PHONY: vim
vim:
	 ln -s ~/$(PWD)/vim ~/.config/vim
	 ln -s ~/.config/vim  ~/.vim

.PHONY: sync
sync:
	mkdir -p ~/.config
	[ -f ~/.config/fish/config.fish ] || ln -s $(PWD)/fish ~/.config/fish
	[ -f ~/.config/git/config ] || ln -s $(PWD)/git ~/.config/git
	[ -f ~/.config/tmux/tmux.conf ] || ln -s $(PWD)/tmux ~/.config/tmux
	[ -f ~/.ignore ] || ln -s $(PWD)/ignore ~/.ignore

.PHONY: clean
clean:
	rm -f ~/.config/vim
	rm -f ~/.config/fish
	rm -f ~/.config/git
	rm -f ~/.config/tmux
	rm -f ~/.ignore

.PHONY:
macos:
	nix-env -i aws-vault
	nix-env -i awscli
	nix-env -i curl
	nix-env -i direnv
	nix-env -i fish
	nix-env -i fzf
	nix-env -i git
	nix-env -i htop
	nix-env -i jq
	nix-env -i jump
	nix-env -i ripgrep
	nix-env -i silver-searcher
	nix-env -i tmux
	nix-env -i tree
	nix-env -i vim
	nix-env -i cfssl
	nix-env -i go
	nix-env -i node
	nix-env -i terraform
	nix-env -i pstree
	nix-env -i gsed


.PHONY: ec2
ubuntu:
	nix-env -i curl
	nix-env -i direnv
	nix-env -i fish
	nix-env -i fzf
	nix-env -i git
	nix-env -i htop
	nix-env -i jq
	nix-env -i jump
	nix-env -i ripgrep
	nix-env -i silver-searcher
	nix-env -i tmux
	nix-env -i tree
	nix-env -i vim

