# Shortcuts
alias copyssh="pbcopy < $HOME/.ssh/id_ed25519.pub"
alias reloadshell="source $HOME/.zshrc"
alias reloaddns="dscacheutil -flushcache && sudo killall -HUP mDNSResponder"
alias ll="/opt/homebrew/opt/coreutils/libexec/gnubin/ls -AhlFo --color"
alias shrug="echo '¯\_(ツ)_/¯' | pbcopy"
alias c="clear"
alias compile="commit 'compile'"
alias version="commit 'version'"
alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"

# Directories
alias dotfiles="cd $DOTFILES"
alias library="cd $HOME/Library"
alias sites="cd $HOME/Sites"

# JS
alias nfresh="rm -rf node_modules/ package-lock.json && npm install"
alias watch="npm run watch"

# Docker
# alias docker-composer="docker-compose"

# SQL Server
# alias mssql="docker run -e ACCEPT_EULA=Y -e SA_PASSWORD=LaravelWow1986! -p 1433:1433 mcr.microsoft.com/mssql/server:2017-latest"

# Git
alias gst="git status"
alias gb="git branch"
alias gc="git checkout"
alias gl="git log --oneline --decorate --color"
alias amend="git add . && git commit --amend --no-edit"
alias commit="git add . && git commit -m"
alias diff="git diff"
alias force="git push --force"
alias nuke="git clean -df && git reset --hard"
alias pop="git stash pop"
alias pull="git pull"
alias push="git push"
alias resolve="git add . && git commit --no-edit"
alias stash="git stash -u"
alias unstage="git restore --staged ."
alias wip="commit wip"

# Python & Conda
#alias setupconda="eval \"$(~/miniforge3/bin/conda shell.zsh hook)\""

# Create x86 conda environment
create_x86_conda_environment () {
# example usage: create_x86_conda_environment myenv_x86 python=3.9
 CONDA_SUBDIR=osx-64 conda create -n $@
 conda activate $1
}
# Create ARM conda environment
create_ARM_conda_environment () {
# example usage: create_ARM_conda_environment myenv_x86 python=3.9
 CONDA_SUBDIR=osx-arm64 conda create -n $@
 conda activate $1
}

# # Enable aliases to be sudo’ed
# alias sudo="sudo "

# # Navigation
# alias ..="cd .."
# alias ...="cd ../.."
# alias ....="cd ../../.."
# alias .....="cd ../../../.."
# alias -- -="cd -"

# # Shortcuts
# alias ls="ls --color"
# alias -- +x="chmod +x"
# alias o="open"
# alias oo="open ."
# alias e="$EDITOR"
# alias cc="code ."

# # GitHub Desktop
# alias gh="github ."

# # ForkLift
# alias k="open -a ForkLift"
# alias kk="open -a ForkLift ."

# # Bat: https://github.com/sharkdp/bat
# command -v bat >/dev/null 2>&1 && alias cat="bat --style=numbers,changes"

# # trash-cli: https://github.com/sindresorhus/trash-cli
# [ -d ~/dotfiles/node_modules/trash-cli ] && alias rm="~/dotfiles/node_modules/trash-cli/cli.js"

# # Download file and save it with filename of remote file
# alias get="curl -O -L"

# # Run npm script without annoying noise
# alias nr="npm run --silent"

# # Jest watch
# alias j="npx jest --watch"

# # Make a directory and cd to it
# take() {
#   mkdir -p $@ && cd ${@:$#}
# }

# cd into whatever is the forefront Finder window
cdf() {
  cd "`osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)'`"
}

# Magic Project Opener
repo() {
  cd "$(~/dotfiles/bin/repo $1)"
}

## Cd to Git repository root folder
#gr() {
#  cd "./$(git rev-parse --show-cdup 2>/dev/null)" 2>/dev/null
#}

# git clone and cd to a repo directory
clone() {
  git clone $@
  if [ "$2" ]; then
    cd "$2"
  else
    cd $(basename "$1" .git)
  fi
  if [[ -r "./yarn.lock" ]]; then
    yarn
  elif [[ -r "./package-lock.json" ]]; then
    npm install
  fi
}
