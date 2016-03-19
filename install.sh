#!/bin/bash -e

# Overwrites current emacs settings

if [ -z "$HOME" ]; then
	>&2 echo "Error: HOME unset"
	exit 2
fi

REPO_DIR=$( cd $(dirname $0) ; pwd -P )
EMACSD_DIR="${HOME}/.emacs.d"

ln -s -f "${REPO_DIR}/init.el" "${HOME}/.emacs"
mkdir -p "$EMACSD_DIR"
ln -s -f "${REPO_DIR}/customizations" "$EMACSD_DIR"
