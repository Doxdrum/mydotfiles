# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

## PATH="$HOME/Software/git.src/emacs-25.1/bin:/usr/local/sbin:/usr/sbin:/sbin:$PATH"

export EMAIL="o.castillo.felisola@gmail.com"
export NAME="Oscar Castillo-Felisola"
export SMTPSERVER="smtp.gmail.com"

## PATH=/usr/local/texlive/2016/bin/x86_64-linux:$PATH; export PATH
## MANPATH=/usr/local/texlive/2016/texmf-dist/doc/man:$MANPATH; export MANPATH
## INFOPATH=/usr/local/texlive/2016/texmf-dist/doc/info:$INFOPATH; export INFOPATH

export SAGE_BROWSER="firefox-esr"