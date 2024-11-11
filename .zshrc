# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# My zsh config

export EDITOR=nvim

# Aliases
alias vi=nvim
alias vim=nvim
alias vf='nvim $(fzf)'

# Zinit
### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust
### End of Zinit's installer chunk

# Zinit plugins
# prompt
zinit ice depth=1; zinit light romkatv/powerlevel10k 

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# keybindings for autocompletion
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# History
HISTSIZE=10000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_find_no_dups

# fzf shell integration
#if command -v fzf &> /dev/null; then
#  source <(fzf --zsh)
#else
#  echo "fzf unavailable"
#fi
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# thefuck integration
if command -v thefuck &> /dev/null; then
  eval $(thefuck --alias)
else
  echo "thefuck unavailable"
fi

# zoxide integration
if command -v zoxide &> /dev/null; then
  eval "$(zoxide init --cmd cd zsh)"
else
  echo "zoxide unavailable"
fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/danielrahme/mambaforge/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/danielrahme/mambaforge/etc/profile.d/conda.sh" ]; then
        . "/home/danielrahme/mambaforge/etc/profile.d/conda.sh"
    else
        export PATH="/home/danielrahme/mambaforge/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "/home/danielrahme/mambaforge/etc/profile.d/mamba.sh" ]; then
    . "/home/danielrahme/mambaforge/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<

