set -gxp PATH $HOME/go/bin
set -gx GOBIN $HOME/go/bin
set -gx EDITOR vim

set -g fish_user_paths "/usr/local/sbin" $fish_user_paths
set -gxp PATH /usr/local/opt/python@3.9/libexec/bin

# git prompt settings
set -g __fish_git_prompt_show_informative_status 1
set -g __fish_git_prompt_showdirtystate 'yes'
set -g __fish_git_prompt_char_stateseparator ' '
set -g __fish_git_prompt_char_dirtystate "✖"
set -g __fish_git_prompt_char_cleanstate "✔"
set -g __fish_git_prompt_char_untrackedfiles "…"
set -g __fish_git_prompt_char_stagedstate "●"
set -g __fish_git_prompt_char_conflictedstate "+"
set -g __fish_git_prompt_color_dirtystate yellow
set -g __fish_git_prompt_color_cleanstate green --bold
set -g __fish_git_prompt_color_invalidstate red
set -g __fish_git_prompt_color_branch cyan --dim --italics

# don't show any greetings
set fish_greeting ""

# don't describe the command for darwin
# https://github.com/fish-shell/fish-shell/issues/6270
function __fish_describe_command; end

set -gx GOPATH ~/go
set -gx GOROOT /usr/local/go
set -gxp PATH $GOROOT/bin
set -gpx PATH $GOPATH/bin

# Simplify go modules with geckoboard
set -gx GOPRIVATE "github.com/geckoboard/*"

# Add fenv to path
set fish_function_path $fish_function_path ~/plugin-foreign-env/functions

# Source Nix setup script
if test -e ~/.nix-profile/etc/profile.d/nix.sh
	fenv source ~/.nix-profile/etc/profile.d/nix.sh
end

set -gx LOCALE_ARCHIVE (nix-env --installed --no-name --out-path --query glibc-locales)'/lib/locale/locale-archive'

alias vim 'vim -p -N -n -u "~/.config/vim/vimrc"'
alias vi vim

direnv hook fish | source
