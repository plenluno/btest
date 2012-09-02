#!/bin/sh

DEFAULT=$'\e[0m'
RED=$'\e[0;31m'
GREEN=$'\e[0;32m'

OK=$GREEN"[BTEST OK ]"$DEFAULT
NG=$RED"[BTEST NG ]"$DEFAULT

if getopts e OPT; then
    ERR="TRUE"
else
    ERR="FALSE"
fi
shift `expr $OPTIND - 1`
$@

if test $? -eq 0; then
    if [ $ERR = "FALSE" ]; then
        echo $OK $@
        exit 0
    else
        echo $NG $@
        exit 1
    fi
else
    if [ $ERR = "TRUE" ]; then
        echo $OK $@
        exit 0
    else
        echo $NG $@
        exit 1
    fi
fi
