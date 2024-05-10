# Move /usr/local/sbin to start of PATH
PATH=/usr/local/bin:$(echo $PATH | sed -e 's/\/usr\/local\/bin\://')
PATH=/usr/local/sbin:$(echo $PATH | sed -e 's/\/usr\/local\/sbin\://')
export PATH

PATH=$PATH:$HOME/bin:$HOME/.local/bin

if [ -d "$HOME/.rbenv" ]; then
  # Add rbenv to path
  PATH="$HOME/.rbenv/bin:$PATH"

  # Initialize rbenv
  eval "$(rbenv init -)"
fi

# Initialize pyenv
if which pyenv &> /dev/null; then eval "$(pyenv init -)"; fi

# Add ghar to path
PATH=$PATH:$HOME/ghar/bin

# Add npm bin to path
PATH=$PATH:/usr/local/share/npm/bin

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
PATH=$PATH:/usr/local/opt/python3/libexec/bin

# Add Cargo (Rust) bin dir to PATH
PATH=$PATH:/Users/chris/.cargo/bin

# Set Postgres data dir
export PGDATA=/usr/local/var/postgres

# This is needed to sign git commits
export GPG_TTY=$(tty)

# Set up nix
#. /Users/chris/.nix-profile/etc/profile.d/nix.sh

# Make fzf use ag as its find command so it respects .gitignore, .gitignore_global, etc.
export FZF_DEFAULT_COMMAND='ag --ignore node_modules -g ""'

# Set JAVA_HOME to Java 8
#[ -f /usr/libexec/java_home ] && export JAVA_HOME=$(/usr/libexec/java_home)
#
# Set JAVA_HOME to Java 21
export JAVA_HOME=$(cs java-home --jvm corretto@21)

# Function to easily downgrade to Java 8
java8() {
  export JAVA_HOME=$(cs java-home --jvm adopt:1.8)
}

# Call this function to enable the nvm command.
# For some reason this is really slow, so I don't run it eagerly when opening a new terminal pane
nvm_init() {
  export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
}

# Add .NET Core SDK tools
export PATH="$PATH:/Users/chris/.dotnet/tools"

# >>> coursier install directory >>>
export PATH="$PATH:/Users/chris/Library/Application Support/Coursier/bin"
# <<< coursier install directory <<<

export LOADED_ZPROFILE=true
