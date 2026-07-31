
HISFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999

setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward

#starship init
eval "$(starship init zsh)"
# Custom aliases
alias ls='eza -al'
alias v='nvim'
alias tmux='tmux -u'
alias btop='btop'

source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# opencode
export PATH=/home/fradantu21/.opencode/bin:$PATH
unsetopt PROMPT_SP
