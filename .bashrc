# COMPLETION
if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

# GIT IN THE PATH
function parse_git_dirty {
git diff --quiet HEAD &>/dev/null
  [[ $? == 1 ]] && echo "⚡"
}
function parse_git_branch {
 local branch=$(__git_ps1 "%s")
  [[ $branch ]] && echo "[$branch$(parse_git_dirty)]"
}
export PS1='\[\033[0;33m\]\w\[\033[0m\]$(parse_git_branch)\[\033[0;37m\]:\[\033[0;37m\] '

# HEROKU CREDS
function hset() {
  rm ~/.heroku/credentials
  ln -s ~/.heroku/$1_credentials ~/.heroku/credentials
}

# ALIASES
alias ll='ls -lhFGtr'
alias flush='echo "flush_all" | nc localhost 11211'
alias use="rvm use $1"
alias h="heroku"
alias be="bundle exec"

export EDITOR=mate