export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$GOPATH/bin
export GOPATH=$HOME/go
export GOROOT=/usr/local/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOPATH
export PATH=$PATH:$GOROOT/bin

path+=$HOME/go/bin
path+=$HOME/.local/share/pnpm
path+=$HOME/.local/bin
path+=$HOME/lua-language-server/bin
path+=$HOME/.cargo/bin

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="alanpeabody"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' mode reminder  # just remind me to update when it's time
zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User configuration

export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"

# Default profile

alias ci="conan install ."
alias cb="conan build . -c tools.build:skip_test=true"
alias ct="conan build ."
alias cib="ci && ct"
 
# arm profile

alias ci-arm="conan install . -pr=arm"
alias cb-arm="conan build . -pr=arm -c tools.build:skip_test=true"
alias ct-arm="conan build . -pr=arm"
alias cib-arm="ci-arm && ct-arm"
alias exec-arm="qemu-arm-static -L /usr/arm-linux-gnueabihf/" 

# clang profile

alias ci-clang="conan install . -pr=clang"
alias cb-clang="conan build . -pr=clang -c tools.build:skip_test=true"
alias ct-clang="conan build . -pr=clang"
alias cib-clang="ci-clang && ct-clang"

eval "$(zoxide init zsh --cmd cd)"
