# HomeBrew
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
# HomeBrew END

# export GPG_TTY
export GPG_TTY=$TTY

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load plugins
zinit snippet https://github.com/SukkaW/zsh-osx-autoproxy/raw/master/zsh-osx-autoproxy.plugin.zsh
zinit snippet https://github.com/DarrinTisdale/zsh-aliases-exa/raw/master/zsh-aliases-exa.plugin.zsh
zinit load zdharma-continuum/history-search-multi-word
zinit ice blockf; zinit light zsh-users/zsh-completions

# Load oh-my-zsh plugins
zinit snippet OMZ::plugins/git/git.plugin.zsh
zinit snippet OMZ::plugins/alias-finder/alias-finder.plugin.zsh
zinit snippet OMZ::plugins/macos/macos.plugin.zsh
zinit snippet OMZ::plugins/extract/extract.plugin.zsh
zinit snippet OMZ::plugins/gitignore/gitignore.plugin.zsh
zinit snippet OMZ::plugins/colored-man-pages/colored-man-pages.plugin.zsh
zinit snippet OMZ::plugins/sudo/sudo.plugin.zsh

# Load powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/z-a-rust \
    zdharma-continuum/z-a-as-monitor \
    zdharma-continuum/z-a-patch-dl \
    zdharma-continuum/z-a-bin-gem-node

### End of Zinit's installer chunk

### Start of lazy-load zinit plugins
zinit ice wait'0'; zinit light zsh-users/zsh-autosuggestions
zinit ice wait'0' atinit"zpcompinit; zpcdreplay"; zinit light zdharma-continuum/fast-syntax-highlighting
zinit ice wait'0'; zinit snippet https://github.com/agkozak/zsh-z/raw/master/zsh-z.plugin.zsh
### End of lazy-load

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# aliases
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias c='clear'
alias open_command='open'
