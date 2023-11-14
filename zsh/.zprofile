#!/usr/bin/zsh
#
export _JAVA_AWT_WM_NONREPARENTING=1
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/go/bin"

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
	exec sway
fi
