autoload -Uz vcs_info
autoload -U add-zsh-hook
theme_precmd () { vcs_info }
add-zsh-hook precmd theme_precmd
setopt prompt_subst

UNSTAGEDSTR="%{$fg_bold[red]%}*%{$reset_color%}"
STAGEDSTR="%{$fg_bold[yellow]%}+%{$reset_color%}"
FORMATS="%{$fg_bold[magenta]%}(%{$reset_color%}"
FORMATS+="%{$fg_bold[green]%}%b%c%u%m%{$reset_color%}"
FORMATS+="%{$fg_bold[magenta]%})%{$reset_color%} "
ACTIONFORMATS="%{$fg_bold[magenta]%}(%{$reset_color%}"
ACTIONFORMATS+="%{$fg_bold[green]%}%b%c%u%m%{$reset_color%}"
ACTIONFORMATS+="%{$fg_bold[yellow]%}|%{$reset_color%}"
ACTIONFORMATS+="%{$fg_bold[red]%}%a%c%{$reset_color%}"
ACTIONFORMATS+="%{$fg_bold[magenta]%})%{$reset_color%} "

zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr $UNSTAGEDSTR
zstyle ':vcs_info:*' stagedstr $STAGEDSTR
zstyle ':vcs_info:*' formats $FORMATS
zstyle ':vcs_info:*' actionformats $ACTIONFORMATS
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked

+vi-git-untracked() {
  if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
     git status --porcelain | grep -m 1 '^??' &>/dev/null
  then
    hook_com[misc]="%{$fg_bold[blue]%}?%{$reset_color%}"
  fi
}


PROMPT="%{$fg_bold[red]%}%n%{$reset_color%}"
if [ -n "$SSH_CLIENT" ]; then
    PROMPT+="%{$fg[yellow]%}@%m%{$reset_color%}:"
else
    PROMPT+=":"
fi
PROMPT+="%{$fg_bold[blue]%}%~%{$reset_color%} "
PROMPT+='${vcs_info_msg_0_}'
PROMPT+="%# "

if [[ "$TERM_PROGRAM" != "vscode" && -f "/usr/local/bin/battery" ]]; then
  RPROMPT='$(/usr/local/bin/battery)'
fi
