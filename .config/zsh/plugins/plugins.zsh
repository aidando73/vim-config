pdir=~/.config/zsh/plugins


# ***INSTALL REQUIRED*** Autojump
[[ -s /home/giahuydo99/.autojump/etc/profile.d/autojump.sh ]] && source /home/giahuydo99/.autojump/etc/profile.d/autojump.sh
autoload -U compinit && compinit -u
# ***INSTALL REQUIRED*** fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# zsh-syntax-highlighting
source ${pdir}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# zsh-autosuggestions 
source ${pdir}/zsh-autosuggestions/zsh-autosuggestions.zsh
# colored-man-pages
source ${pdir}/colored-man-pages/colored-man-pages.plugin.zsh
# bd
source ${pdir}/bd/bd.zsh
