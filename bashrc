### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Perlbrew
source $HOME/local/perl5/perlbrew/etc/bashrc

# Python
export PYENV_ROOT=$HOME/local/pyenv
export PATH="$PYENV_ROOT/shims:$PATH"
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

# RVM
#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
if [ -s "$HOME/etc/rvmrc" ]; then
    source "$HOME/etc/rvmrc"
fi # to have $rvm_path defined if set
if [ -s "${rvm_path-$HOME/.rvm}/scripts/rvm" ]; then
    source "${rvm_path-$HOME/.rvm}/scripts/rvm"
fi
#PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

#---------------------------------------------
# ENV
export EDITOR=vim
alias v='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'

#---------------------------------------------
# Prompt
if [ -e $HOME/etc/git-prompt.sh]; then
  source $HOME/etc/git-prompt.sh
fi
if [ -e $HOME/etc/git-completion.bash]; then
  source $HOME/etc/git-completion.bash
fi
export PS1='\[\033[1;36m\]\h[\u: \w]\[\033[1;33m\]$(__git_ps1)\n\[\033[1;36m\]✘˵╹◡╹˶✘ \[\033[00m\]'
export CLICOLOR=1
export LSCOLORS=DxGxcxdxCxegedabagacad

#---------------------------------------------
# Usuful
alias g=git
alias v=vim
alias l='ls -F'
alias prev='cd $OLDPWD'

#---------------------------------------------
# Git
alias gg='git grep -n'

#---------------------------------------------
# Bundler
alias bi='bundle install --path vendor/bundle'
alias be='bundle exec'
alias bc='bundle console'
alias bo='bundle outdated'
alias ber='bundle exec rspec'
alias bec='bundle exec cucumber -v'
