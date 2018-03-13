#/usr/bin/env bash

echo "Setting up boot & linkboot scripts"

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
complete -o nospace -F _complete_boot boot

_complete_linkboot () {
	COMPREPLY=()
	cur="${COMP_WORDS[COMP_CWORD]}"
	files=`ls /usr/local/siteminder/conf/hosts/$(hostname)`
	COMPREPLY=( $(compgen -W "$files" -- $cur))
	return 0
}
complete -o nospace -F _complete_linkboot linkboot
