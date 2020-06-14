#!/usr/bin/env bash
# -*- coding: utf-8; mode: bash -*-
set -euo pipefail
IFS=$'\n\t'

THIS="$(readlink -f "$0")"
readonly THIS

function on_exit() {
    errcode="$1"
}

trap 'on_exit $?' EXIT

function on_error() {
    errcode=$1
    linenum=$2
    echo "[ERROR] $THIS: errcode: $errcode linenum: $linenum"
}

trap 'on_error $? $LINENO' ERR

exit 0
