# Custom theme for Oh My Zsh by Andy Wardley <abw@wardley.org>
function prompt_char {
  if [ $UID -eq 0 ]; then echo "%{$fg[red]%}# %{$reset_color%}"; else echo "%{$reset_color%}$ "; fi
}

function git_is_dirty() {
  local ref
  if [[ "$(__git_prompt_git config --get oh-my-zsh.hide-status 2>/dev/null)" != "1" ]]; then
    ref=$(__git_prompt_git symbolic-ref HEAD 2> /dev/null) || \
    ref=$(__git_prompt_git rev-parse --short HEAD 2> /dev/null) || return 0
    echo "$ZSH_THEME_GIT_PROMPT_PREFIX$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
}

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg_bold[red]%} dirty ✗"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%} clean ✔︎"

PROMPT='%{$fg[cyan]%}[%{$reset_color%}%n@%m %{$fg[yellow]%}%~%{$fg[cyan]%}] %{$fg[green]%}$(git_current_branch)%{$reset_color%}
$(prompt_char)'
RPROMPT='%{$(echotc UP 1)%}$(git_is_dirty)%{$(echotc DO 1)%}'
