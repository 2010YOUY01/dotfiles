source ~/zsh-snap/znap.zsh
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path setup
export PATH="$HOME/.cargo/bin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export ASAN_OPTIONS=detect_container_overflow=0
export HOMEBREW_CORE_GIT_REMOTE=https://mirrors.ustc.edu.cn/homebrew-core.git
export OPENSSL_ROOT_DIR=/usr/local/opt/openssl
export EDITOR=nvim # For git interactive rebase


# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="miloshadzic"
# ZSH_THEME="risto"
ZSH_THEME="yyt"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(autojump git zsh-autosuggestions zsh-syntax-highlighting zsh-vim-mode)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias lc="leetcode"
alias e="nvim"
alias timeout="gtimeout"
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  alias say='echo "$1" | espeak 2>/dev/null'
  alias sayy='say "Task Done"'
elif [[ "$OSTYPE" == "darwin"* ]]; then
  alias sayy='say -v Mei-jia "任务完成"'
fi

# GPT related
alias tslt="sgpt --role tslt"
alias txtemoji="sgpt --role txtemoji"
alias toemoji="sgpt --role toemoji"
alias gptldr="sgpt --role tldr"

# By default, let curl do `-L` for auto redirection, `-O` for naming the local file the same as remote one
alias download="curl -LO"

# fzf default setup
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# fzf include hidden .files
export FZF_DEFAULT_COMMAND="find . -path '*/\.*' -type d -prune -o -type f -print -o -type l -print 2> /dev/null | sed s/^..//"
# Using highlight (http://www.andre-simon.de/doku/highlight/en/highlight.html)
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
if [ "$(uname 2> /dev/null)" = "Linux" ]; then
    source $HOME/dotfiles/key-bindings.zsh
    source $HOME/dotfiles/completion.zsh
fi
 
# Brew config
export HOMEBREW_AUTO_UPDATE_SECS="86400"
export HOMEBREW_NO_AUTO_UPDATE="1"

# How long to wait additional char in sequence
KEYTIMEOUT=1

# 6.s081 setup
PATH=$PATH:/usr/local/opt/riscv-gnu-toolchain/bin
PATH=$PATH:/usr/local/opt/llvm/bin
PATH=$PATH:~/.local/bin
# 6.824
PATH="$PATH:$HOME/bin"

# nnn cd on quit
n ()
{
    # Block nesting of nnn in subshells
    if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
        echo "nnn is already running"
        return
    fi

    # The default behaviour is to cd on quit (nnn checks if NNN_TMPFILE is set)
    # To cd on quit only on ^G, remove the "export" as in:
    #     NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    # NOTE: NNN_TMPFILE is fixed, should not be modified
    NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    nnn "$@"

    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}

# init autojump
if [ "$(uname 2> /dev/null)" = "Linux" ]; then
    . /usr/share/autojump/autojump.sh
fi

# autosuggestions keybindings
bindkey -r "^F"
bindkey "^F" forward-word

# zsh-autocomplete
# znap source marlonrichert/zsh-autocomplete

# >>> xmake >>>
[[ -s "$HOME/.xmake/profile" ]] && source "$HOME/.xmake/profile" # load xmake profile
# <<< xmake <<<
export JAVA_HOME=$(/usr/libexec/java_home -v 17.0.2)

source $HOME/.cargo/env

# environment variables for grpc
export MY_INSTALL_DIR=$HOME/.local
export PATH="$MY_INSTALL_DIR/bin:$PATH"

# rust specific environment variables
export RUSTFLAGS="-C link-arg=-fuse-ld=lld"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/yongting/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/yongting/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/yongting/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/yongting/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# proxy
export http_proxy=http://127.0.0.1:1087
export https_proxy=http://127.0.0.1:1087
export ALL_PROXY=socks5://127.0.0.1:1080

# postgis
export LIBRARY_PATH=/usr/local/Cellar/protobuf-c/1.5.0_3/lib:$LIBRARY_PATH
export LD_LIBRARY_PATH=/usr/local/Cellar/protobuf-c/1.5.0_3/lib:$LD_LIBRARY_PATH
export DYLD_LIBRARY_PATH=/usr/local/Cellar/protobuf-c/1.5.0_3/lib:$DYLD_LIBRARY_PATH
export PATH="/usr/local/opt/llvm/bin:$PATH"

# sccache
export RUSTC_WRAPPER=sccache
