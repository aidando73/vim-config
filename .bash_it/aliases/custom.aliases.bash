#!/bin/bash

#Specific directories
BDIR='~/.bash_it/aliases'
SDIR='~/.setup'

#alias dison="xrandr --output eDP-1 --auto; killall polybar; nohup sh ~/.config/polybar/startpolybar.sh; source ~/.setup/refresh.bash"
#alias disoff="xrandr --output eDP-1 --off; killall polybar; nohup sh ~/.config/polybar/startpolybar.sh; source ~/.setup/refresh.bash"

# Some locations
alias cduni="cd ~/2020/s2/"
alias cdds="cd ~/2020/s2/ds"
alias cdesasi="cd ~/2020/s2/esasi"
alias cdplay="cd ~/2020/play"
alias cdos="cd ~/2020/s2/os"
alias cdedc="cd ~/2020/s2/edc"

# Editing Settings
alias resetup="vim ${SDIR}/setup.bash; source ${SDIR}/setup.bash"
alias regit="vim ${SDIR}/gitsetup; source ${SDIR}/gitsetup"
alias reload="vim ${SDIR}/onload.bash; source ${SDIR}/onload.bash"
alias rebash="vim ~/.bashrc; source ~/.bashrc"
alias reinput="vim ~/.inputrc; bind -f ~/.inputrc"
alias realias="vim ${BDIR}/custom.aliases.bash; source ${BDIR}/custom.aliases.bash"
alias retheme="vim ~/.bash_it/themes/cupcake/cupcake.theme.bash; source ~/.bashrc"
alias revim="vim ~/.vimrc"
alias revifm="vim ~/.config/vifm/vifmrc"
alias rekey="vim ~/.Xmodmap; source ~/.setup/refresh.bash"
alias rei3="sudovim ~/.config/i3/config; i3-msg restart"
alias rei3status="vim ~/.config/i3/i3blocks.conf; i3-msg restart"
alias repoly="vim ~/.config/polybar/config"
alias refresh="vim ~/.setup/refresh.bash; source ${SDIR}/refresh.bash"
alias refont="vim ~/.config/fontconfig/fonts.conf; fc-cache"

# Run Settings
alias restart="source ${SDIR}/onload.bash"

# ls 
alias ls='ls -F -h --color=always -v --author --time-style=long-iso'
alias lsa='ls -a'
alias lsl='ls -l'

# Coloured grep
alias grep='grep --color=auto'


alias bashit='bash-it'
alias q='exit'
alias c='clear'
alias p='cat'


# easy cd commands
alias cdh='cd ~'
alias up='cd ..'
alias up1='cd ..'
alias up2='cd ../..'
alias up3='cd ../../..'
alias up4='cd ../../../..'
alias up5='cd ../../../../..'
alias up6='cd ../../../../../..'
alias up7='cd ../../../../../../..'
alias up8='cd ../../../../../../../..'
alias up9='cd ../../../../../../../../..'


#Sudo commands
alias sudovim='sudo -E vim'

#clipboard
alias xclip='xclip -selection c'

#svn aliases
alias scom='svn commit -m'
alias sadd.='svn add --force * --auto-props --parents --depth infinity -q'
