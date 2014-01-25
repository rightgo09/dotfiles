# Perlbrew
source $HOME/local/perl5/perlbrew/etc/bashrc

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

#---------------------------------------------
# Prompt
source $HOME/etc/git-prompt.sh
source $HOME/etc/git-completion.bash
export PS1='\[\033[1;36m\]\h[\u: \w]\[\033[1;33m\]$(__git_ps1)\n\[\033[1;36m\]✘╹◡╹✘ \[\033[00m\]'
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
alias bc='bundle outdated'
alias ber='bundle exec rspec'
alias bec='bundle exec cucumber -v'
