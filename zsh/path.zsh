# Prepend $PATH without duplicates
function _prepend_path() {
	if ! $( echo "$PATH" | tr ":" "\n" | grep -qx "$1" ) ; then
		PATH="$1:$PATH"
	fi
}

# Construct $PATH
# 1. Default paths
# 2. ./node_modules/.bin - shorcut to run locally installed Node bins
# 3. Custom bin folder for n, Ruby, CoreUtils, dotfiles, etc.
# PATH='/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin'
# PATH seems to be set prior to shell loading this custom path list so we don't want to blow away the Brew additions
[ -d "$N_PREFIX/bin" ] && _prepend_path "$N_PREFIX/bin"
[ -d $DOTFILES/bin ] && _prepend_path "$DOTFILES/bin"
[ -d $HOME/bin ] && _prepend_path "$HOME/bin"

# Add CLI commands for MacVim & Sublime Text
[ -d "/Applications/Sublime\ Text.app/Contents/SharedSupport/bin" ] && _prepend_path "/Applications/Sublime\ Text.app/Contents/SharedSupport/bin"
[ -d "/opt/homebrew/Cellar/macvim/8.2-171_1/MacVim.app/Contents/bin" ] && _prepend_path "/opt/homebrew/Cellar/macvim/8.2-171_1/MacVim.app/Contents/bin"

_prepend_path "./vendor/.bin"
_prepend_path "./node_modules/.bin"

export PATH

# Load Node global installed binaries
# export PATH="$HOME/.node/bin:$PATH"

echo "LOADED $DOTFILES/zsh/path.zsh"