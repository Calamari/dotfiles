
# dont check if you have new mail
unset MAILCHECK

# allow git branch in prompt
parse_git_branch ()
{
  local b="$(git symbolic-ref HEAD 2>/dev/null)";
  if [ -n "$b" ]; then
    printf " (%s)" "${b##refs/heads/}";
  fi
}
# Bash prompt:
# \w current path
#    current git branch
PS1="\w\$(parse_git_branch)$ "

# include aliases
[[ -f ~/.aliases ]] && source ~/.aliases

# include git autocompletion
if [ -f ~/.git-completion.bash ]; then
  source ~/.git-completion.bash
fi

# Allow more files to be opened simultanously
ulimit -n 2560

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

