#!/usr/bin/env bash

unlock_base() {
    rbw get base | base64 -d | git --git-dir=$WH/dotfiles.git/ --work-tree=$WH "$@" crypt unlock -
}

unlock_base
