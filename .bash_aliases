
# General linux command
#alias l='ls --color=always -Alh | grep --color=never "^d\|^l.*/.\[0m$" && ls --color=always -Alh | grep --color=never -v "^d\|^l.*/.\[0m$\|^total"'
#alias ll='ls --color=always -Alh | grep --color=never "^d\|^l.*/.\[0m$" && ls --color=always -Alh | grep --color=never -v "^d\|^l.*/.\[0m$\|^total"'
alias l='exa -al --color=always --group-directories-first'
alias ls='exa -al --color=always --group-directories-first'
alias la='exa -a --color=always --group-directories-first'
alias ll='exa -l --color=always --group-directories-first'
alias lt='exa -aT --color=always --group-directories-first'
alias l.='exa -a | egrep "^\."'
alias .1='cd ../'
alias .2='cd ../../'
alias .3='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../../'
alias ~='cd ~'
alias home='cd ~'
alias code='cd ~/Code/'
alias docs='cd ~/Documents/'
alias pics='cd ~/Pictures/'
alias script='cd ~/Scripts/'
alias scripts='cd ~/Scripts/'
alias update='sudo apt-get update && sudo apt-get upgrade' # && sudo apt-get dist-upgrade'
alias install='sudo apt-get install '

#safety
alias cp='cp -i'
alias df='df -h'

#edit config files
alias aliases='vim ~/.bash_aliases'
alias paliases='vim ~/.bash_aliases_private'
alias bashrc='vim ~/.bashrc'
alias emcfg='vim ~/.doom.d/config.el'
alias eminit='vim ~/.doom.d/init.el'
alias empkg='vim ~/.doom.d/packages.el'
alias srcaliases='source ~/.bash_aliases && source ~/.bash_aliases_private'
alias srcbashrc='source ~/.bashrc'


#emacs
alias emacs="/usr/bin/emacs -nw"
alias em="emacsclient -c -a 'emacs'"
alias emdbg="emacsclient -c -a 'emacs --debug-init' "

# GIT stuff
# 'Config' for Dotfiles project 
alias config='/usr/bin/git --git-dir=$HOME/Dotfiles --work-tree=$HOME'
alias cfgadd='/usr/bin/git --git-dir=$HOME/Dotfiles --work-tree=$HOME add '
alias cfgaddall='/usr/bin/git --git-dir=$HOME/Dotfiles --work-tree=$HOME add --force --update'
alias cfgcommit='/usr/bin/git --git-dir=$HOME/Dotfiles --work-tree=$HOME commit -m '
alias cfgpush='/usr/bin/git --git-dir=$HOME/Dotfiles --work-tree=$HOME push'
alias cfgremotepruneorigin='/usr/bin/git --git-dir=$HOME/Dotfiles --work-tree=$HOME remote prune origin'
alias cfgreset='/usr/bin/git --git-dir=$HOME/Dotfiles --work-tree=$HOME reset'
alias cfgstatus='/usr/bin/git --git-dir=$HOME/Dotfiles --work-tree=$HOME status'


