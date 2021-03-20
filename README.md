# dotfiles

Highly inspired by [Faith's dotfiles](http://github.com/fatih/dotfiles)

# setup vim-plug

## Big Sur

```
sh <(curl -L https://nixos.org/nix/install) --darwin-use-unencrypted-nix-store-volume
```

## Linux

```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

# open vim and install all plugins

```
:PLugInstall
```

# setup nix and dev environment

```
curl -L https://nixos.org/nix/install | sh
```

Add `. /home/vagrant/.nix-profile/etc/profile.d/nix.sh` to `~/.bash_profile` or `~/bash_rc`

```
make apps
```

# vagrant

Add `/home/vagrant/.nix-profile/bin/fish` to `/etc/shells`

```
chsh -s /home/vagrant/.nix-profile/bin/fish
```
