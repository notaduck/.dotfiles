#  ______ _____ _   _ ______  _____ 
# |___  //  ___| | | || ___ \/  __ \
#    / / \ `--.| |_| || |_/ /| /  \/
#   / /   `--. \  _  ||    / | |    
# ./ /___/\__/ / | | || |\ \ | \__/\
# \_____/\____/\_| |_/\_| \_| \____/
#

# zmodload zsh/zprof
# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"

# export PYENV_ROOT="$HOME/.pyenv"
# export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
# export PATH="$PYENV_ROOT/bin:$PATH"
# export PATH="$PATH:/home/daniel/.dotnet/tools"
#
NPM_PACKAGES="${HOME}/.npm-packages"

export PATH="$PATH:$NPM_PACKAGES/bin"

# Preserve MANPATH if you already defined it somewhere in your config.
# Otherwise, fall back to `manpath` so we can inherit from `/etc/manpath`.
export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# General settings {{{

	setopt autocd
	setopt automenu
	setopt histignorealldups
	setopt histignorespace
	setopt inc_append_history
	setopt listpacked
	setopt promptsubst
	setopt share_history

	HISTFILE=~/.histfile
	HISTSIZE=5000
	SAVEHIST=5000

	bindkey -v
	bindkey '^R' history-incremental-search-backward

	autoload -U colors && colors # Enable colors
	autoload -U compinit

	zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
	zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
	zstyle ':completion:*' menu select
	zstyle ':completion:*' special-dirs true

	zmodload zsh/complist
	compinit -i

# }}}

# zplugin {{{
	 source ~/.zplugin/bin/zplugin.zsh

	# zplugin snippet OMZ::plugins/git/git.plugin.zsh
	# zplugin cdclear -q # <- forget completions provided by Git plugin
	# | completions | #
	# zplugin ice wait'!1'
	 zplugin light zsh-users/zsh-completions
	 zplugin light zsh-users/zsh-autosuggestions

	 zplugin snippet OMZ::plugins/git/git.plugin.zsh
	 zplugin snippet OMZ::lib/git.zsh
	 zplugin snippet OMZ::themes/theunraveler.zsh-theme
	 zplugin ice "https://github.com/larkery/zsh-histdb"

	 zplugin ice wait lucid
	 zplugin snippet OMZ::plugins/colored-man-pages/colored-man-pages.plugin.zsh

# }}}

# Functions {{{
	# function countdown(){
	# 	 date1=$((`date +%s` + $1)); 
	# 	 while [ "$date1" -ge `date +%s` ]; do 
	# 		 echo -ne "$(date -u --date @$(($date1 - `date +%s`)) +%H:%M:%S)\r";
	# 		 sleep 0.1
	# 	 done
	# }

	# function stopwatch(){
	# 	date1=`date +%s`; while true; do 
	# 		echo -ne "$(date -u --date @$((`date +%s` - $date1)) +%H:%M:%S)\r"; 
	# 		sleep 0.1
	# 	 done
	# }
# }}}
 
# Include {{{
	[ -f "$HOME/.config/aliasrc.sh" ] && source "$HOME/.config/aliasrc.sh"
# }}}

# zprof
