
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

# Allow more files to be opened simultanously
ulimit -n 2560
