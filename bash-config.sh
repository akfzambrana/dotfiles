#!/bin/bash

NO_COLOR="\[\033[0m\]"

RED="\[\033[0;31m\]"
BOLD_RED="\[\033[01;31m\]"
LIGHT_RED="\[\033[0;91m\]"
LIGHT_BOLD_RED="\[\033[01;91m\]"

GREEN="\[\033[0;32m\]"
BOLD_GREEN="\[\033[01;32m\]"
LIGHT_GREEN="\[\033[0;92m\]"
LIGHT_BOLD_GREEN="\[\033[01;92m\]"

YELLOW="\[\033[00;33m\]"
BOLD_YELLOW="\[\033[01;33m\]"
LIGHT_YELLOW="\[\033[0;93m\]"
LIGHT_BOLD_YELLOW="\[\033[01;93m\]"

BLUE="\[\033[00;34m\]"
BOLD_BLUE="\[\033[01;34m\]"
LIGHT_BLUE="\[\033[0;94m\]"
LIGHT_BOLD_BLUE="\[\033[01;94m\]"

MAGENTA="\[\033[0;35m\]"
BOLD_MAGENTA="\[\033[01;35m\]"
LIGHT_MAGENTA="\[\033[0;95m\]"
LIGHT_BOLD_MAGENTA="\[\033[01;95m\]"

CYAN="\[\033[0;36m\]"
BOLD_CYAN="\[\033[01;36m\]"
LIGHT_CYAN="\[\033[0;96m\]"
LIGHT_BOLD_CYAN="\[\033[011;96m\]"

LIGHT_GRAY="\[\033[0;37m\]"
BOLD_LIGHT_GRAY="\[\033[01;37m\]"

function get_package_version() {
  if [[ -f package.json ]]
  then
    cat package.json | grep version | head -1 | awk -F: '{ print $2 }' | sed 's/[",\t ]//g'
  fi
}

function remove_bluetooth_devices() {
  for device in $(bluetoothctl devices  | grep -o "[[:xdigit:]:]\{8,17\}"); do
      echo "removing bluetooth device: $device | $(bluetoothctl remove $device)"
  done
}

function color_my_prompt {
  local __user_and_host="$LIGHT_BOLD_MAGENTA\u" # \u@\h
  # local __user_and_host="$BOLD_RED\h" # \u@\h
  local __cur_location="$NO_COLOR\W"  # capital 'W': current directory, small 'w': full file path
  local __git_branch_color="$BOLD_GREEN"
  local __prompt_tail="$CYAN$"
  local __user_input_color="$NO_COLOR"
  local __git_branch='$(__git_ps1)';

  # colour branch name depending on state
  if [[ "$(__git_ps1)" =~ "*" ]]; then     # if repository is dirty
      __git_branch_color="$LIGHT_RED"
  elif [[ "$(__git_ps1)" =~ "$" ]]; then   # if there is something stashed
      __git_branch_color="$LIGHT_YELLOW"
  elif [[ "$(__git_ps1)" =~ "%" ]]; then   # if there are only untracked files
      __git_branch_color="$LIGHT_CYAN"
  elif [[ "$(__git_ps1)" =~ "+" ]]; then   # if there are staged files
      __git_branch_color="$BOLD_LIGHT_GRAY"
  fi

  # Build the PS1 (Prompt String)
  PS1="$__user_and_host $__cur_location$__git_branch_color$__git_branch$__prompt_tail$__user_input_color "
}

# configure PROMPT_COMMAND which is executed each time before PS1
export PROMPT_COMMAND=color_my_prompt

# if .git-prompt.sh exists, set options and execute it
if [ -f ~/.git-prompt.sh ]; then
  GIT_PS1_SHOWDIRTYSTATE=true
  GIT_PS1_SHOWSTASHSTATE=true
  GIT_PS1_SHOWUNTRACKEDFILES=true
  GIT_PS1_SHOWUPSTREAM="auto"
  GIT_PS1_HIDE_IF_PWD_IGNORED=true
  GIT_PS1_SHOWCOLORHINTS=true
  . ~/.git-prompt.sh
fi

# if tmux exists, set as default terminal
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi

export CDPATH=".:~:~/workspace:/workspace"
export PATH=~/bin:$PATH
