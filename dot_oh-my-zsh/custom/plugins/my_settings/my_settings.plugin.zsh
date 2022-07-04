# Add your own custom plugins in the custom/plugins directory. Plugins placed
# here will override ones with the same name in the main plugins directory.

# Colorized man pages
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# Infinite History
HISTFILE=.zsh_history
HISTTIMEFORMAT="%Y/%m/%d %H:%M:%S:   "
setopt HIST_IGNORE_ALL_DUPS  	# Never add duplicate entries.
setopt appendhistory		# Append history
setopt HIST_REDUCE_BLANKS    	# Remove unnecessary blank lines.

# show ISO8601 timestamp with history
alias history="fc -li 1"

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

# easier to read disk
alias df='df -h'     # human-readable sizes
alias free='free -m' # show sizes in MB
alias ll='ls -l' # show long list
alias la='ls -la' # long list with hiddne files
alias lt='ls --tree -I Library'
alias tree='tree -C'	#tree alway in colors
alias mc="mc --nosubshell" #fix slow start of midnight commander with Oh my ZSH

# Cat on wings
alias cat='bat --paging=never'

#FZF
export FZF_DEFAULT_COMMAND='fd --type f --color=never --hidden'
export FZF_DEFAULT_OPTS='--no-height --color=bg+:#343d46,gutter:-1,pointer:#ff3c3c,info:#0dbc79,hl:#0dbc79,hl+:#23d18b'

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview 'bat --color=always --line-range :50 {}'"

export FZF_ALT_C_COMMAND='fd --type d . --color=never --hidden'
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -50'"


#zsh-history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down



#----------------------------------------------------------------
case "$(uname -s)" in

Darwin)
	# echo 'Mac OS X'
	alias ls='lsd'
	;;

Linux)
	alias ls='ls --color=auto'
	;;

CYGWIN* | MINGW32* | MSYS* | MINGW*)
	# echo 'MS Windows'
	;;
*)
	# echo 'Other OS'
	;;
esac

