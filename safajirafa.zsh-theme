# Safajirafa zsh theme

# git:
# %b => current branch
# %a => current action (rebase/merge)

# prompt:
# %F => color dict
# %f => reset color
# %~ => current path
# %* => time
# %n => username
# %m => shortname host
# %(?..) => prompt conditional - %(condition.true.false)

# terminal codes:
# \e7   => save cursor position
# \e[2A => move cursor 2 lines up
# \e[1G => go to position 1 in terminal
# \e8   => restore cursor position
# \e[K  => clears everything after the cursor on the current line

function git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_PREFIX$(current_branch)$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

function precmd() {
    # with hostname
    #print -rP '%F{166}%m: %F{136}%~ $(git_prompt_info)'

    # without hostname
    print -rP '%F{136}%~ $(git_prompt_info)'
}

PROMPT='%f❯ '

ZSH_THEME_GIT_PROMPT_PREFIX="["
ZSH_THEME_GIT_PROMPT_SUFFIX="]%f"
ZSH_THEME_GIT_PROMPT_DIRTY="%F{160}+"
ZSH_THEME_GIT_PROMPT_CLEAN="%F{64}"
