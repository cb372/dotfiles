# Move /usr/local/sbin to start of PATH
PATH=/usr/local/bin:$(echo $PATH | sed -e 's/\/usr\/local\/bin\://')
PATH=/usr/local/sbin:$(echo $PATH | sed -e 's/\/usr\/local\/sbin\://')
export PATH

PATH=$PATH:$HOME/bin:$HOME/.local/bin

# Add rbenv to path
PATH="$HOME/.rbenv/bin:$PATH"

# Initialize rbenv
eval "$(rbenv init -)"

# Initializa pyenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

# Add ghar to path
PATH=$PATH:$HOME/ghar/bin

# Add npm bin to path
PATH=$PATH:/usr/local/share/npm/bin

# Add Android SDK tools to path
export ANDROID_HOME=$HOME/Library/Android/sdk
PATH=$PATH:$ANDROID_HOME/tools

# Add Packer to path
export PACKER_HOME=/usr/local/opt/packer/bin
PATH=$PATH:$PACKER_HOME

export HOMEBREW_GITHUB_API_TOKEN=$(cat ~/homebrew_github_api_token.txt)
export COC_GITHUB_USERS_TOKEN=$(cat ~/coc-github-users-token.txt)

source ${HOME}/.zprofile.local

# Sort out locale for Python programs (e.g. AWS CLI)
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Set Node environment
export NODE_ENV=development

# Add Gopath to PATH
export GOPATH=$HOME/go
PATH=$PATH:$GOPATH/bin

# Add Python bin dir to PATH
PATH=$PATH:/Users/chris/Library/Python/3.6/bin

# Add Cargo (Rust) bin dir to PATH
PATH=$PATH:/Users/chris/.cargo/bin

# Set Postgres data dir
export PGDATA=/usr/local/var/postgres

# This is needed to sign git commits
export GPG_TTY=$(tty)

# Set up nix
#. /Users/chris/.nix-profile/etc/profile.d/nix.sh

# Make fzf use ag as its find command so it respects .gitignore, .gitignore_global, etc.
export FZF_DEFAULT_COMMAND='ag -g ""'

# Set JAVA_HOME to Java 8
export JAVA_HOME=$(/usr/libexec/java_home)

export LOADED_ZPROFILE=true
