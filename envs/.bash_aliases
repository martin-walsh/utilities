#/usr/bin/env bash

echo "Setting up boot & linkboot scripts"

apptail() {
	tail -100f /usr/local/siteminder/var/log/$1
}

pullconfig() {
	pushd /usr/local/siteminder/ > /dev/null

	if [[ -z "$1" ]]; then
		bin/synchronize-config.sh
	else
		bin/synchronize-config.sh config-$1
	fi

	popd > /dev/null
}

boot() {
	pushd /usr/local/siteminder/ > /dev/null
	bin/spring-boot.sh "conf/hosts/$(hostname)/$1" $2
	popd > /dev/null
}

linkboot() {
	pushd /usr/local/siteminder/ > /dev/null
	bin/spring-boot-link.sh "conf/hosts/$(hostname)/$1"
	popd > /dev/null
}

tomcat() {
	pushd /usr/local/siteminder/ > /dev/null
	bin/$2-engine.sh "engines/$1"
	popd > /dev/null
}

tcsummary() {
	pushd /usr/local/siteminder/ > /dev/null
	bin/synchronize-summary.rb
	popd > /dev/null
}

tctail() {
	tail -100f "/usr/local/siteminder/var/log/catalina.$1.out"
}

tcping() {
	ps -ef | grep "[e]ngines/$1"
}

tcexplode() {
	pushd /usr/local/siteminder/ > /dev/null
	bin/synchronize-exploded.sh
	popd > /dev/null
}

linktomcat() {
	pushd /usr/local/siteminder/ > /dev/null
	bin/synchronize-webapps.sh "engines/$1"
	popd > /dev/null
}

_complete_apptail () {
	COMPREPLY=()
	cur="${COMP_WORDS[COMP_CWORD]}"
	files=`ls /usr/local/siteminder/var/log/ | egrep '*.log$'`
	COMPREPLY=( $(compgen -W "$files" -- $cur))
	return 0
}
complete -o nospace -F _complete_apptail apptail

_complete_pullconfig () {
	COMPREPLY=()
	cur="${COMP_WORDS[COMP_CWORD]}"

	opts=("cmbeta tpi")
	COMPREPLY=( $(compgen -W "$opts" -- $cur))

	return 0
}
complete -o nospace -F _complete_pullconfig pullconfig

_complete_boot () {
	COMPREPLY=()
	cur="${COMP_WORDS[COMP_CWORD]}"

	if [ $COMP_CWORD -eq 1 ]; then
		files=`ls /usr/local/siteminder/conf/hosts/$(hostname)`
		COMPREPLY=( $(compgen -W "$files" -- $cur))
	elif [ $COMP_CWORD -eq 2 ]; then
		opts=("start stop restart status")
		COMPREPLY=( $(compgen -W "$opts" -- $cur))
	fi

	return 0
}
complete -F _complete_boot boot

_complete_linkboot () {
	COMPREPLY=()
	cur="${COMP_WORDS[COMP_CWORD]}"
	files=`ls /usr/local/siteminder/conf/hosts/$(hostname)`
	COMPREPLY=( $(compgen -W "$files" -- $cur))
	return 0
}
complete -o nospace -F _complete_linkboot linkboot


_complete_tomcat () {
	COMPREPLY=()
	cur="${COMP_WORDS[COMP_CWORD]}"

	if [ $COMP_CWORD -eq 1 ]; then
		files=`find /usr/local/siteminder/conf/hosts/$(hostname) -type f -name engine-*.yaml -exec basename {} .yaml \;`
		COMPREPLY=( $(compgen -W "$files" -- $cur))
	elif [ $COMP_CWORD -eq 2 ]; then
		opts=("start stop")
		COMPREPLY=( $(compgen -W "$opts" -- $cur))
	fi

	return 0
}
complete -o nospace -F _complete_tomcat tomcat

_complete_linktomcat () {
	COMPREPLY=()
	cur="${COMP_WORDS[COMP_CWORD]}"
	files=`find /usr/local/siteminder/conf/hosts/$(hostname) -type f -name engine-*.yaml -exec basename {} .yaml \;`
	COMPREPLY=( $(compgen -W "$files" -- $cur))
	return 0
}

complete -o nospace -F _complete_linktomcat linktomcat
complete -o nospace -F _complete_linktomcat tctail
complete -o nospace -F _complete_linktomcat tcping
