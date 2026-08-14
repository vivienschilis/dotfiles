#!/usr/bin/env bash
# Setup dev environment on ec2 vagrant.
set -euo pipefail

DOTFILES_REPO="https://github.com/vivienschilis/dotfiles.git"
DOTFILES_DIR="$HOME/dotfiles"

# 1. Nix, via the official multi-user (daemon) installer - matches
# fish/config.fish's fenv sourcing of /nix/var/nix/profiles/default's
# profile.d scripts, and wires nix into every login shell system-wide
# (/etc/profile.d/nix.sh) rather than just this user's.
if ! command -v nix >/dev/null 2>&1; then
  sh <(curl -L https://nixos.org/nix/install) --daemon
fi
# shellcheck disable=SC1091
. /etc/profile.d/nix.sh

# 2. Clone the dotfiles.
if [ ! -d "$DOTFILES_DIR" ]; then
  git clone "$DOTFILES_REPO" "$DOTFILES_DIR"
fi

# 3. Install packages (nix-env) and symlink fish/git/tmux/ignore configs.
# cd rather than "make -C": the Makefile's sync/vim targets use $(PWD), which
# make -C does not update (only $(CURDIR) reflects it), so invoking via -C
# from elsewhere silently symlinks against $HOME instead of the checkout.
(cd "$DOTFILES_DIR" && make ubuntu && make sync)

mkdir -p "$HOME/.config"
ln -sfn "$DOTFILES_DIR/vim" "$HOME/.config/vim"
ln -sfn "$HOME/.config/vim" "$HOME/.vim"

# 4. vim-plug (bootstrap file isn't in the repo, per the dotfiles README) and
# the plugins vimrc's Plug lines declare. -es (silent Ex mode) + --sync run
# PlugInstall headlessly, without needing a real terminal - unlike the
# normal :PlugInstall, which drives an interactive UI in a scratch buffer.
curl -fLo "$HOME/.vim/autoload/plug.vim" --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim -u "$HOME/.config/vim/vimrc" -es -c "PlugInstall --sync" -c "qa"

# 5. fish as the login shell.
FISH="$HOME/.nix-profile/bin/fish"
grep -qxF "$FISH" /etc/shells || echo "$FISH" | sudo tee -a /etc/shells >/dev/null
sudo chsh -s "$FISH" "$(whoami)"

# 6. Go workspace.
mkdir -p "$HOME/go/src/github.com/geckoboard"

# 7. GitHub auth via gh (installed by "make ubuntu" above), wired into git
# with "gh auth setup-git" - a github.com-scoped credential.helper that
# coexists with the dotfiles' own global credential.helper = store (used
# for anything that isn't github.com). --web prints a one-time code + URL
# rather than needing a manual PAT: log in from any device, gh polls until
# it's approved. Needs a real terminal - skips if run non-interactively
# (e.g. `ssh host bash script.sh`) rather than hanging; rerun this script
# over an interactive session to log in.
if ! gh auth status >/dev/null 2>&1; then
  if [ -t 0 ]; then
    GH_BROWSER=echo gh auth login --hostname github.com --git-protocol https --web
    gh auth setup-git
  else
    echo "Skipping GitHub auth (no terminal attached) - rerun this script interactively to log in." >&2
  fi
fi

echo "Done. Log back in (or run 'exec fish') to pick up the new shell and env."
