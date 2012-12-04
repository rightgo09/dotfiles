# default customize
alias grep='grep --color=tty'
alias tree='tree -C'

# typo
alias boybu=byobu

# 1 char alias
alias g=git
alias v=vim
alias l='ls -F'

# 2 char alias
alias gf='git flow'

# bundler
alias bi='bundle install --path vendor/bundler'
alias be='bundle exec'
alias ber='bundle exec rspec'
alias bec='bundle exec cucumber -v'

# git util
source ~/.git-completion.bash

# util
alias prev='cd $OLDPWD'

# display
export PS1='\[\033[1;36m\]\h[\u: \w]\[\033[1;33m\]$(__git_ps1)\n\[\033[1;36m\]\$ \[\033[0;37m\]'
export CLICOLOR=1
export LSCOLORS=DxGxcxdxCxegedabagacad

# Ruby Version Manager
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
