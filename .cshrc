# $FreeBSD: releng/11.1/share/skel/dot.cshrc 278616 2015-02-12 05:35:00Z cperciva $
#
# .cshrc - csh resource script, read at beginning of execution by each shell
#
# see also csh(1), environ(7).
# more examples available at /usr/share/examples/csh/
#

alias h		history 25
alias j		jobs -l
alias la	ls -aGF
alias lf	ls -FA
alias ll	ls -lAF

# These are normally set through /etc/login.conf.  You may override them here
# if wanted.
# set path = (/sbin /bin /usr/sbin /usr/bin /usr/local/sbin /usr/local/bin $HOME/bin)
# setenv	BLOCKSIZE	K
# A righteous umask
# umask 22

setenv	EDITOR	vi
setenv	PAGER	more

switch($TERM)
        case "xterm*":
                setenv TITLE "%{\033]0;%n@%m:%~\007%}"
                breaksw
        default:
                setenv TITLE ""
                breaksw
endsw

if ($?prompt) then
	# An interactive shell -- set some stuff up
	#set prompt = "%N@%m:%~ %# "
	#set prompt = "${TITLE}%n@%m:%~%#"	
	#set prompt = '%/ %# '
set prompt = "%B%n@%m%b %{\033[32;1m%}%l%{\033[m%} [%{\033[34;1m%}%c04%{\033[m%}]: "	
	set promptchars = '$#'

	set filec
	set history = 1000
	set savehist = (1000 merge)
	set autolist = ambiguous
	# Use history to aid expansion
	set autoexpand
	set autorehash
	set mail = (/var/mail/$USER)
	if ( $?tcsh ) then
		bindkey "^W" backward-delete-word
		bindkey -k up history-search-backward
		bindkey -k down history-search-forward
	endif

endif
