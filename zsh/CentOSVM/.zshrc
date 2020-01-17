export TERM="xterm-256color"
export P4CONFIG=P4ENV
export P4EDITOR=vim
export PATH=$PATH:~/bin:~/scripts:/auto/tools/bin
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export SRCTOP=/home/aby_ross/perforce/li_11/app
export BUILD_LEVEL=nightly

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd nomatch
unsetopt beep notify
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/auto/home13/aby_ross/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
#
POWERLEVEL9K_CONTEXT_REMOTE_FOREGROUND='250'
POWERLEVEL9K_CONTEXT_REMOTE_BACKGROUND='060'

POWERLEVEL9K_DIR_HOME_BACKGROUND='071'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='071'
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='029'
POWERLEVEL9K_DIR_ETC_BACKGROUND='009'
POWERLEVEL9K_DIR_NOT_WRITABLE_BACKGROUND='160'

POWERLEVEL9K_PROMPT_ADD_NEWLINE=true

source  /home/aby_ross/github/powerlevel9k/powerlevel9k.zsh-theme
source  /home/aby_ross/github/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
