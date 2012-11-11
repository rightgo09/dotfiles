# default customize
alias grep='grep --color=tty'
alias tree='tree -C'

# typo
alias boybu=byobu

# 1 char alias
alias g=git
alias v=vim
alias l='ls -F'

# bundler
alias bi='bundle install --path vendor/bundler'
alias be='bundle exec'
alias ber='bundle exec rspec'

# display
export PS1='\[\033[1;36m\]\h[\u: \w]\n\$\[\033[1;37m\] '
export CLICOLOR=1
export LSCOLORS=DxGxcxdxCxegedabagacad

# Ruby Version Manager
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
