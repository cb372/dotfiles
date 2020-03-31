# Explicitly set $SHELL
export SHELL=/bin/zsh

# Set EDITOR (e.g. for SVN commit messages)
export EDITOR=/usr/bin/vim

# Load .zprofile if for some reason it hasn't been loaded
if [ "$LOADED_ZPROFILE" != "true" ]; then
  source ~/.zprofile
  export LOADED_ZPROFILE=true
fi

# Use Ctrl-A, Ctrl-E, etc for jumping within line
# Note: all other bindkey commands must come after this line, as it resets bindings
bindkey -e

# History
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt SHAREHISTORY
setopt HIST_IGNORE_SPACE
bindkey '^r' history-incremental-pattern-search-backward

# The following lines were added by compinstall
zstyle :compinstall filename '/home/chris/.zshrc'

autoload -Uz compinit compdef
compinit
# End of lines added by compinstall

# AWS auto completion (note: this must come after the call to `compinit`)
[ -f /usr/local/bin/aws_zsh_completer.sh ] && source /usr/local/bin/aws_zsh_completer.sh

# Completion
setopt COMPLETE_IN_WORD
# Show a select menu when you press TAB twice
zstyle ':completion:*' menu select

# Don't beep!
setopt NO_BEEP

# Automatically prepend 'cd ' to directory
setopt AUTO_CD

# Make things colourful
autoload colors
zmodload zsh/terminfo
colors
alias ls='ls -G'
alias grep='grep --color=auto'

# Partially type a command then hit up/down to find relevant commands
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

# Alt-j,k to move back/forward one word
bindkey '' backward-word
bindkey '' forward-word

# Aliases
alias ll='ls -l'
alias la='ls -a'
alias lal='ll -a'
alias '...'='../..'
alias g='git'
alias gs='git status'
alias gd='git diff'
alias gdc='git diff --cached'
alias gl='git log --graph --date=short --pretty="format:%C(yellow)%h%Cblue%d%Creset %s %C(white) %an, %ad (%ar)%Creset"'
alias gl-nocolour='git log --no-color --graph --date=short --pretty="format:%h%d %s %an, %ad (%ar)"'
alias git-cleanup='git branch --merged | grep -v "\*" | grep -v master | xargs -n 1 git branch -d'
alias git-prune='git remote prune origin'
alias git-catchup='if [ -z "$(git status --porcelain)" ]; then git checkout master; git pull; else echo "Oops, working directory is dirty"; fi'
alias oops='git commit --amend'
alias top='top -o cpu'
alias vim=nvim
alias vimdiff='nvim -d'
alias fvim='nvim $(fzf)'

clone() {
  cd ~/code
  hub clone 47deg/$1
}

# Set up easy_install to install packages to /usr/local/lib/python2.7/site-packages
alias easy_install='easy_install --prefix /usr/local' 

# Typo aliases
alias exut='exit'

# Fuck aliases
alias fuck='eval $(thefuck $(fc -ln -1))'
alias FUCK='fuck'

# Docker aliases
alias sigh='docker ps -q | xargs docker kill; yes | docker container prune'

# Global aliases
alias -g H='| head'
alias -g HN='| head -n'
alias -g L='| less'
alias -g NS='| sort -n'
alias -g NUL='> /dev/null 2>%1'
alias -g SU='| sort -u'
alias -g T='| tail'
alias -g TN='| tail -n'
alias -g V='| vim -R -'

# Expand aliases when I press space
expandalias() {
  zle _expand_alias
  zle self-insert
}
zle -N expandalias
bindkey " " expandalias
bindkey "^ " magic-space           # control-space to bypass completion
bindkey -M isearch " " magic-space # normal space during searches

#Useful functions
function psgrep() { ps axuf | grep -v grep | grep "$@" -i --color=auto; }
function fname() { find . -iname "*$@*"; }
function fix() {
  vim $1
  echo -n "OK to mark as merged? [y/N] "
  read ans
  case $ans in
    y|Y)
      git add $1
      ;;
  esac
}
function s() { ssh -o StrictHostKeyChecking=no ec2-user@$1 }

#Add git info to RHS prompt
autoload -Uz vcs_info
autoload -Uz add-zsh-hook
setopt prompt_subst
zstyle ':vcs_info:*' actionformats '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:*' formats       '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{5}]%f '
zstyle ':vcs_info:*' enable git

vcs_info_wrapper() {
  vcs_info
  stashes=""
  if [[ -e $PWD/.git/refs/stash ]]; then
    stashes="($(git stash list 2>/dev/null | wc -l | sed 's/^ *//g') stashes)"
  fi
  if [ -n "$vcs_info_msg_0_" ]; then
    export vcs_info_msg_0_="%{$fg[grey]%}${vcs_info_msg_0_}${stashes}%{$reset_color%}$del"
  fi
}

add-zsh-hook precmd vcs_info_wrapper

# Prompt
# <green>[user@host history path]</green> newline colon
PROMPT='%{$fg[green]%}[%n@%m %h %~]%{$reset_color%} ${vcs_info_msg_0_}
$ '

# Moved git info to main prompt because it gets in the way when copy-pasting commands and output
#RPROMPT='${vcs_info_msg_0_}'

# Set up rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Set up autojump
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

# Disable annoying 'no matches found' warning
setopt nonomatch

# Show pwd as tmux window name
precmd () {
  if [ "$CUSTOMISED_TMUX_WINDOW" == "" ]; then
    if [ "$(pwd)" == "$HOME" ]; then
      dir="<home>"
    else
      dir="$(basename $(pwd))"
    fi
    tmux rename-window "$dir" 2>/dev/null
  fi
}

rename-window() {
  tmux rename-window "$@"
  export CUSTOMISED_TMUX_WINDOW=true
}

# Validate a CloudFormation template
validate_cloudformation() {
  aws --region eu-west-1 cloudformation validate-template --template-body "file://${1:a}"
}

# added by travis gem
[ -f /Users/chris/.travis/travis.sh ] && source /Users/chris/.travis/travis.sh

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Set up boot2docker
eval "$(docker-machine env dev 2>/dev/null)"

# OPAM configuration (OCaml package manager)
. ~/.opam/opam-init/init.zsh > /dev/null 2>&1 || true

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/chris/code/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/chris/code/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/chris/code/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/chris/code/google-cloud-sdk/completion.zsh.inc'; fi

PATH="/Users/chris/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/chris/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/chris/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/chris/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/chris/perl5"; export PERL_MM_OPT;

### ZNT's installer added snippet ###
fpath=( "$fpath[@]" "$HOME/.config/znt/zsh-navigation-tools" )
autoload n-aliases n-cd n-env n-functions n-history n-kill n-list n-list-draw n-list-input n-options n-panelize n-help
autoload znt-usetty-wrapper znt-history-widget znt-cd-widget znt-kill-widget
alias naliases=n-aliases ncd=n-cd nenv=n-env nfunctions=n-functions nhistory=n-history
alias nkill=n-kill noptions=n-options npanelize=n-panelize nhelp=n-help
zle -N znt-history-widget
bindkey '^R' znt-history-widget
setopt AUTO_PUSHD HIST_IGNORE_DUPS PUSHD_IGNORE_DUPS
zstyle ':completion::complete:n-kill::bits' matcher 'r:|=** l:|=*'
### END ###

sbtnew() {
  local projectname=$1
  local sbtversion=${2:-1.3.8}
  local scalaversion=${3:-2.13.1}
  cd ~/code
  mkdir $projectname
  cd $projectname
  mkdir project
  echo "sbt.version=$sbtversion" > project/build.properties
  cat > build.sbt <<EOF
scalaVersion := "$scalaversion"
libraryDependencies ++= Seq(
  //"" %% "" % ""
)
EOF
  cat > project/plugins.sbt <<EOF
//addSbtPlugin("" %% "" % "")
EOF
}

sbtlatest() {
  local projectname=$1
  local latestsbt=$(curl -s https://repo1.maven.org/maven2/org/scala-sbt/sbt/maven-metadata.xml | xmllint --xpath '/metadata/versioning/latest/text()' -)
  local latestscala=$(curl -s https://repo1.maven.org/maven2/org/scala-lang/scala-compiler/maven-metadata.xml | xmllint --xpath '/metadata/versioning/latest/text()' -)
  sbtnew "$projectname" "$latestsbt" "$latestscala"
}
export PATH="/usr/local/opt/ruby/bin:$PATH"
