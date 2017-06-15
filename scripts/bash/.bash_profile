export M2_HOME=/usr/local/apache-maven-2.2.1
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/local/git/bin:/usr/X11/bin:$GRAILS_HOME/bin:$GROOVY_HOME/bin:/usr/local/mysql/bin:/Users/martinwalsh/bin:$M2_HOME/bin
export HISTCONTROL=ignoredups
export HISTSIZE=10000
# export PS1='\[\033[01;32m\]\h\[\033[01;34m\] \W\[\033[31m\]$(__git_ps1 " {%s}") \[\033[01;34m\]\u\$\[\033[00m\] ' # WITH COLOUR
export PS1='\t :\W$(__git_ps1 " {%s}")\$ ' # NO COLOUR
export GIT_PS1_SHOWUPSTREAM="verbose git"
export GIT_PS1_SHOWDIRTYSTATE=1

export GRAILS_OPTS="-XX:MaxPermSize=1024m -Xmx1024M -server"
export SITEMINDER_HOME=$HOME/siteminder/siteminder-home
export SITEMINDER_USER=martinwalsh
export DEBUG_JVM=0

export IDEA_VM_OPTIONS=$HOME/idea.vmoptions

source $HOME/bin/lib/env.sh

complete -C $HOME/dotfiles/public/bash/completion_scripts/grails_completion -o default grails
complete -C $HOME/dotfiles/public/bash/completion_scripts/list_apps_completion -o default list
complete -C $HOME/dotfiles/public/bash/completion_scripts/rake_completion -o default rake
source $HOME/bin/lib/ssh-completion
complete -C $HOME/dotfiles/public/bash/completion_scripts/thor_completion -o default thor
source $HOME/dotfiles/public/git/git-completion.bash
source $HOME/bin/lib/cd-scripts.sh

if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

source $HOME/bin/lib/completion.sh

source $HOME/bin/lib/docker-scripts.sh

alias reloadShell="source ~/.bash_profile"
alias home="cd ~/"
alias ls="ls -p"
alias ll="ls -lp"
alias la="ls -ap"
alias lal="ls -alp"

alias g="grails -reloading"
alias gd="grails-debug -reloading"
alias gt="grails -DskipBower=true test-app"
alias gl="grails test load-sample-data"
alias glog="grails --plain-output"
alias gmi="grails maven-install"
alias gug="gvm use grails"
alias gti="git"

alias tspc="thor siteminder:project:compile"
alias tspcl="thor siteminder:project:clear_script_cache"
alias tsup="thor siteminder:project:update_plugins"

alias gmc="git st; sublime ."

alias resetIntelliJLayout="groovy ~/bin/resetIntelliJLayout"
alias xmlToClosure="groovy ~/bin/xmlToClosure"
alias switch-java="source $HOME/bin/lib/switch-java $@"

source $HOME/bin/lib/ssh-aliases.sh

alias mysql_start="sudo /usr/local/mysql/support-files/mysql.server start"
alias mysql_stop="sudo /usr/local/mysql/support-files/mysql.server stop"
alias mysql_restart="sudo /usr/local/mysql/support-files/mysql.server restart"

#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
[[ -s "/Users/martinwalsh/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/martinwalsh/.sdkman/bin/sdkman-init.sh"

alias gvm="sdk"

eval "$(rbenv init -)"

source $HOME/bin/lib/initialize-java-version
