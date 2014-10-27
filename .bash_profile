function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working directory clean" ]] && echo "*"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/ [\1$(parse_git_dirty)]/"
}

export EDITOR="/usr/bin/emacs"
export PATH="/usr/local/bin:$PATH"
export PS1='\u@\h \[\033[1;33m\]\w\[\033[0m\]$(parse_git_branch) $ '

if [[ -d ~/.profile.d ]] && [[ $(ls ~/.profile.d/ | wc -l) -gt 0 ]]; then
    for f in ~/.profile.d/*; do
        source $f
    done
fi
