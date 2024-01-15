# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

export EDITOR="nvim"

# plugins
plugins=(
  docker
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  z
)

source $ZSH/oh-my-zsh.sh

# aliases 
alias ll="exa --long --header --git --all"
alias l="exa --long --header --git --all"
alias zj="zellij"
alias v="nvim"
alias bat="batcat"
alias glgs="git rev-parse HEAD"
alias gcbr='git branch --sort=-committerdate | fzf --header "Checkout recent branch" --preview "git diff {1} --color=always" --pointer="❯"'
alias lz="lazygit"
# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# fnm
export PATH="$HOME/.local/share/fnm:$PATH"
eval "`fnm env`"

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# Fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
pyenv virtualenvwrapper_lazy

# Zellij autostart
eval "$(zellij setup --generate-auto-start zsh)"

# Starship prompt
eval "$(starship init zsh)"
