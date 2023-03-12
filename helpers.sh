#!/bin/bash

RootCheck() {
    if [[ $EUID -ne 0 ]]; then
	echo "This script must be run as root."
	exit 1
    fi
}

declare -i Errors=0
declare -i Notices=0
HOME_DIR="$(dirname $(pwd))"
USER_NAME="$(basename $HOME_DIR)"

NewLine() {
    echo ""
}

TaggedEcho() {
    echo "[CONFIG] $1"
}

Done() {
    TaggedEcho "DONE"
}

Failure() {
    Errors+=1
    TaggedEcho "*** FAILED ***"
}

Notice() {
    Notices+=1
    TaggedEcho "*** NOTICE ***"
}

PulseReminder() {
    TaggedEcho "If you have no audio in i3, run:"
    echo "      'systemctl enable pulseaudio.service --user'"
}
