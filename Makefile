.PHONY: vim
vim:
	 ln -s $(CURDIR)/vim ~/.config/vim
	 ln -s ~/.config/vim  ~/.vim

.PHONY: sync
sync:
	mkdir -p ~/.config
	[ -f ~/.config/fish/config.fish ] || ln -s $(CURDIR)/fish ~/.config/fish
	[ -f ~/.config/git/config ] || ln -s $(CURDIR)/git ~/.config/git
	[ -f ~/.config/tmux/tmux.conf ] || ln -s $(CURDIR)/tmux ~/.config/tmux
	[ -f ~/.ignore ] || ln -s $(CURDIR)/ignore ~/.ignore

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
	nix-env -i awscli2
	nix-env -i curl
	nix-env -i direnv
	nix-env -i fish
	nix-env -i fzf
	nix-env -i gh
	nix-env -i git
	nix-env -i htop
	nix-env -i jq
	nix-env -i jump
	nix-env -i ripgrep
	nix-env -i silver-searcher-ng
	nix-env -i tmux
	nix-env -i tree
	nix-env -i vim
	nix-env -i cfssl
	nix-env -i go
	nix-env -i nodejs
	nix-env -i terraform
	nix-env -i pstree
	nix-env -i gnused


.PHONY: ec2
ubuntu:
	nix-env -i curl
	nix-env -i direnv
	nix-env -i fish
	nix-env -i fzf
	nix-env -i gh
	nix-env -i git
	nix-env -i htop
	nix-env -i jq
	nix-env -i jump
	nix-env -i ripgrep
	nix-env -i silver-searcher-ng
	nix-env -i tmux
	nix-env -i tree
	nix-env -i vim

.PHONY: nix
nix:
	sh <(curl -L https://nixos.org/nix/install) --daemon
