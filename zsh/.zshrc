# If you come from bash you might have to change your $PATH.
export PATH="$HOME/bin:/usr/local/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.phpenv/bin:$PATH"
export PATH="$PATH:/usr/local/go/bin"
export DENO_INSTALL="/home/leda/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
export PNPM_HOME="/home/leda/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
export PATH="/home/leda/.spicetify:$PATH"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Define certain variables
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export DOTFILES="$HOME/dotfiles"

# START plugins
plugins=(
    docker
    docker-compose
    dotenv
    git
    node
    npm
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-z
)
# END plugins

source $ZSH/oh-my-zsh.sh

# START aliases
alias ll="exa --long --header --icons --all"
alias l="exa --long --header --icons --all"
alias so="source ~/.zshrc"
alias nf="neofetch"
alias bat="batcat"
alias gpl="git pull"
alias v="lvim"
alias sudo="doas"
# END aliases

# START starship 
eval "$(starship init zsh)"
# END starship

# START nvm 
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

autoload -U add-zsh-hook
load-nvmrc() {
  [[ -a .nvmrc ]] || return

  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc
# END nvm

# START pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"

eval "$(pyenv init -)"

pyenv virtualenvwrapper_lazy
# END pyenv

# START fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# END fzf

# START bat
export BAT_THEME="Visual Studio Dark+"
# END bat

# START phpenv 
eval "$(phpenv init -)"
# END phpenv

