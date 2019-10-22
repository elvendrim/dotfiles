#!/usr/bin/env bash

# Load the shell dotfiles, and then some:
for file in ~/.{bash_prompt,bash_aliases}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Set default language and character encoding:
export LANG='en_US.UTF-8';
export LC_ALL='en_US.UTF-8';

# Set personal /bin paths:
# Ensure that this /bin always takes precedence over `/usr/bin`:
export PATH="/usr/local/bin:$PATH"

export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/bin:$PATH";

# Opt-out of Homebrew's analytics:
export HOMEBREW_NO_ANALYTICS=1

# Groom your app’s Ruby environment with .rbenv
# https://github.com/rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# node.js version manager:
# https://github.com/nvm-sh/nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Keep history up to date, across sessions, in realtime:
# http://unix.stackexchange.com/a/48113
# No duplicate entries:
export HISTCONTROL="erasedups:ignoreboth"

# Big history (default is 500):
export HISTSIZE='32768';
export HISTFILESIZE="${HISTSIZE}";

# Append to history, don't overwrite it:
type shopt &> /dev/null && shopt -s histappend

# Don't record some commands:
export HISTIGNORE="&:[ ]*:exit:ls:bg:fg:history:clear"

# Save multi-line commands as one command:
shopt -s cmdhist

# Save and reload the history after each command finishes:
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# Better `cd`-ing:
# Case-insensitive globbing (used in pathname expansion):
shopt -s nocaseglob;

# Correct spelling errors in arguments supplied to `cd`:
shopt -s cdspell;

# Autocorrect on directory names to match a glob:
shopt -s dirspell 2> /dev/null

# Turn on recursive globbing (enables ** to recurse all directories):
shopt -s globstar 2> /dev/null

# Avoid issues with `gpg` as installed via Homebrew:
# https://stackoverflow.com/a/42265848/96656
export GPG_TTY=$(tty);

# Set VS Code as default editor:
export EDITOR='code --wait'
