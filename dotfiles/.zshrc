# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

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

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

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
# plugins=(git zsh-autosuggestions)

# source $ZSH/oh-my-zsh.sh
# source ~/.oh-my-zsh/plugins/git/git.plugin.zsh
# source /sifive/tools/Modules/init-chooser

# User configuration

### History file
HISTFILE=~/.bash_history

#######################################
### EXPORT
#######################################
export TERM="xterm-256color" # getting proper colors
export HISTORY_IGNORE="(ls|cd|pwd|exit|sudo reboot|history|cd -|cd ..)"
# export FIRTOOL_BUILD_MODE=release
export FZF_DEFAULT_COMMAND='rg --files --ignore-vcs --hidden'

### PATH
if [ -d "$HOME/.bin" ] ;
  then PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/Applications" ] ;
  then PATH="$HOME/Applications:$PATH"
fi

# Exception for verible in the path
export PATH="/sifive/tools/google/verible/CentOS-8.3.2011-na-x86_64/verible-v0.0-1430-g19ed159/bin:$PATH"
export PATH="/home/cyrilb/Tools/ripgrep/target/release:$PATH"
export PATH="/home/cyrilb/.local/share/nvim/bin:$PATH"

#######################################
### CHANGE TITLE OF TERMINALS
#######################################
case ${TERM} in
  xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|alacritty|st|konsole*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"'
        ;;
  screen*)
    PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"'
    ;;
esac

#######################################
### ALIASES
#######################################

# Shortcuts
alias c='clear'

# Changing "ls" to "exa"
alias ls='exa -al --color=always --group-directories-first' # my preferred listing
alias ll='exa -l --color=always --group-directories-first'  # long format
alias lt='exa -aT --color=always --group-directories-first' # tree listing
alias l.='exa -a | egrep "^\."'

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

# ps
alias psa="ps auxf"
alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"
alias psmem='ps auxf | sort -nr -k 4'
alias pscpu='ps auxf | sort -nr -k 3'

# git
alias gaddup='git add -u'
alias gaddall='git add .'
alias gbranch='git branch'
alias gco='git checkout'
alias gclone='git clone'
alias gcommit='git commit -m'
alias gfetch='git fetch'
alias gpull='git pull origin'
alias gpush='git push origin'
alias gst='git status'
alias gtag='git tag'
alias gnewtag='git tag -a'

# get error messages from journalctl
alias jctl="journalctl -p 3 -xb"

# youtube-dl
alias yta-aac="youtube-dl --extract-audio --audio-format aac "
alias yta-best="youtube-dl --extract-audio --audio-format best "
alias yta-flac="youtube-dl --extract-audio --audio-format flac "
alias yta-m4a="youtube-dl --extract-audio --audio-format m4a "
alias yta-mp3="youtube-dl --extract-audio --audio-format mp3 "
alias yta-opus="youtube-dl --extract-audio --audio-format opus "
alias yta-vorbis="youtube-dl --extract-audio --audio-format vorbis "
alias yta-wav="youtube-dl --extract-audio --audio-format wav "
alias ytv-best="youtube-dl -f bestvideo+bestaudio "

# ctags
# alias gen-tags = "find . -name \"*.scala\" -type f -print | xargs ctags -R -o .tags"

# EDA tools
alias load-dve="module load synopsys/vcs/R-2020.12-SP1"

# federation shortcuts
alias lsfed='ls -td `find /scratch/$USER/ -maxdepth 3 -type d -name federation -print | "grep" -v "federation\/"`'
alias cdfed='cd `lsfed | head -n 1` ; export federation=`git rev-parse --show-toplevel` ; export BUILD_DIR=`git rev-parse --show-toplevel`/builds > /dev/null '

#######################################
### FUNCTIONS
#######################################

### Function to identicate me
function idme(){
  eval $(ssh-agent)
  ssh-add ~/.ssh/id_rsa
}

# function my_module_load(){
#   module load clang/11.0.1
#   module load synopsys/vcs
#   module load synopsys/vcs/R-2020.12-SP1
#   module load riscv-tools/latest
#   module load cadence/xcelium/20.03.002
#   module load cadence/xcelium/20.03.002_HOTFIX
#   module load cadence/jasper/2021.12
#   module load synopsys/vc_static
#   module load google/verible
#   # module load synopsys/verdi
# }

## Function to pull federation quickly
function getfed {
  if [ -z "$1" ]; then
    echo "usage getfed <folder_name> <branch_name>"
    exit 1
  fi
  git clone --dissociate --reference-if-able /work/github-cache/federation.git git@github.com:sifive/federation.git $1
  cd $1
  export federation=`git rev-parse --show-toplevel`
  export BUILD_DIR=`git rev-parse --show-toplevel`/builds
  if [ -n "$2" ]; then
    git checkout $2
  fi
  ./scripts/quick-submodule-update
}

### Function to look for file or patterns
function look4(){
  grep --color -nri $1 *
}

function look4ext(){
  find . -type f -name "*$1"
}

### Function extract for common file formats ###
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

function extract {
 if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
    echo "       extract <path/file_name_1.ext> [path/file_name_2.ext] [path/file_name_3.ext]"
 else
    for n in "$@"
    do
      if [ -f "$n" ] ; then
          case "${n%,}" in
            *.cbt|*.tar.bz2|*.tar.gz|*.tar.xz|*.tbz2|*.tgz|*.txz|*.tar)
                         tar xvf "$n"       ;;
            *.lzma)      unlzma ./"$n"      ;;
            *.bz2)       bunzip2 ./"$n"     ;;
            *.cbr|*.rar)       unrar x -ad ./"$n" ;;
            *.gz)        gunzip ./"$n"      ;;
            *.cbz|*.epub|*.zip)       unzip ./"$n"       ;;
            *.z)         uncompress ./"$n"  ;;
            *.7z|*.arj|*.cab|*.cb7|*.chm|*.deb|*.dmg|*.iso|*.lzh|*.msi|*.pkg|*.rpm|*.udf|*.wim|*.xar)
                         7z x ./"$n"        ;;
            *.xz)        unxz ./"$n"        ;;
            *.exe)       cabextract ./"$n"  ;;
            *.cpio)      cpio -id < ./"$n"  ;;
            *.cba|*.ace)      unace x ./"$n"      ;;
            *)
                         echo "extract: '$n' - unknown archive method"
                         return 1
                         ;;
          esac
      else
          echo "'$n' - file does not exist"
          return 1
      fi
    done
fi
}

IFS=$SAVEIFS

### FZF ###
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

### Enabling autosuggestions
# git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
export ZSH_AUTOSUGGEST_STRATEGY=(history match_prev_cmd)
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

### Syntax highlighting
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

### Starting starship
eval "$(starship init zsh)"
