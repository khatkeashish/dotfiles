# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# powerlevel10k
source ~/.oh-my-zsh/custom/themes/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# brew
export PATH="/opt/homebrew/bin:$PATH"

########################### CUSTOMIZE ################################
set EDITOR=nvim
alias vim=nvim
alias vi=nvim

########################## TMUX
bindkey -s ^f "tmux-sessionizer\n"
bindkey -s ^s "tmux-pick\n"

# tmux
alias ts="tmux list-sessions"
alias tt="tmux"
alias tn="tmux new-session -s"   # Create a new session
alias tk="tmux kill-session -t"   # Kill a session
ta() {
  local input="${1:-$PWD}"
  local session_name="${input##*/}"
   # local session_name="${1:-${PWD##*/}}"
  if tmux has-session -t "$session_name" 2>/dev/null; then
    tmux attach-session -t "$session_name"
  else
    tmux new-session -s "$session_name" -c "$input"
  fi
}

########################## ZOXIDE
eval "$(zoxide init zsh)"

########################## NVM, NODE
export NVM_DIR=~/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

########################## PYENV
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"


########################## ALIASES
# git
alias gg=lazygit
alias gw="git worktree"
alias gs="git status"
alias ga="git add"
alias gc="git commit -m"

# other
alias cc=clear
alias webui="docker run -d -p 3000:8080 --add-host=host.docker.internal:host-gateway -v open-webui:/app/backend/data --name open-webui --restart always ghcr.io/open-webui/open-webui:main"
alias remove_pycache="$HOME/work/remove_pycache.py"
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
alias code="~/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code"

########################## EXPORTS
export PATH="/opt/homebrew/bin:$PATH" # brew
export PATH="$HOME/.local/bin:$PATH" # poetry
export GOPATH="$HOME/go" # go 
export PATH="$GOPATH/bin:$PATH" # go 
export PATH="$PATH:$HOME/.lmstudio/bin" # lmstudio
export PATH="/opt/homebrew/opt/llvm/bin:$PATH" # llvm, clang, clang++
export PATH="$PATH:$HOME/.local/scripts/" # tmux-sessionizer, tmux-pick
export PATH="$HOME/.cargo/bin:$PATH" # rust

export HAYSTACK_TELEMETRY_ENABLED=False
export LDFLAGS="-L/opt/homebrew/opt/openssl/lib"
export CPPFLAGS="-I/opt/homebrew/opt/openssl/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/openssl/lib/pkgconfig"


