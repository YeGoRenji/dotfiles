# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zap-zsh/zap-prompt"
plug "zsh-users/zsh-syntax-highlighting"
plug "romkatv/powerlevel10k"

# Load and initialise completion system
fpath=(~/.docker/completions \\$fpath)
autoload -U compinit
compinit

# Up down prefix search
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

# ENVs
export PATH="$PATH:$HOME/Applications/app-links"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.fly/bin"
export CURSUS="$HOME/1337"
export JAVA_HOME="$HOME/.jdks/corretto-21.0.2"

# Aliases
alias vim="nvim"
alias i3conf="vim ~/.config/i3/config"
alias polybarconf="vim ~/.config/polybar/config.ini"
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
alias lab='mkdir /tmp/lab &> /dev/null; cd /tmp/lab'
alias zshrc='vim ~/.zshrc'
alias startDocker='sudo systemctl start docker.service'
alias startSshd='sudo systemctl start sshd'
alias open='xdg-open'

cpcompile() {
	g++ $1 -std=c++20 -O2 -Wall
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[[ ! -f /usr/share/nvm/init-nvm.sh ]] || source /usr/share/nvm/init-nvm.sh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/yego/google-cloud-sdk/google-cloud-sdk/path.zsh.inc' ]; then . '/home/yego/google-cloud-sdk/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/yego/google-cloud-sdk/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/yego/google-cloud-sdk/google-cloud-sdk/completion.zsh.inc'; fi

