#/usr/bin/env bash


_complete () {
	COMPREPLY=()
	cur="${COMP_WORDS[COMP_CWORD]}"
	comp_folders=$@
	COMPREPLY=( $(compgen -W "$comp_folders" -- $cur))
	return 0
}

#########################################################################
####                           CD SCRIPTS                            ####
#########################################################################

# Completion for cdc
_complete_cdc_folders () {
	_complete `ls ~/code/`
}
complete -o nospace -F _complete_cdc_folders cdc

# Completion for cdi
_complete_cdi_folders () {
	_complete `ls ~/code/ | grep integration- | cut -d '-' -f 2`
}
complete -o nospace -F _complete_cdi_folders cdi

# Completion for cdr
_complete_cdr_folders () {
	_complete `ls ~/code/ | grep reloaded- | cut -d '-' -f 2`
}
complete -o nospace -F _complete_cdr_folders cdr

# Completion for cdp
_complete_cdp_folders () {
	_complete `ls ~/code/ | grep plugin- | cut -d '-' -f 2`
}
complete -o nospace -F _complete_cdp_folders cdp

#########################################################################
####                               HUB                               ####
#########################################################################


_complete_hub () {
	opts=("compare commits branches releases show")
	_complete $opts
}
complete -o nospace -F _complete_hub hub
