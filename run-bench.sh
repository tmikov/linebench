#!/bin/bash
set -e

prog="${0##*/}"

function err ()
{
    local c=$1
    shift
    echo "$prog: $*" 1>&2
    exit $c
}

[ -z "$1" ] && err 1 "Missing sources directory argument"
SRC="$1"
shift
[ ! -x "$SRC/pb.py" ] && err 2 "Invalid sources directory \"$SRC\""

[ -z "$1" ] && err 1 "Missing input file argument"
INPUT="$1"
shift
[ ! -f "$INPUT" ] && err 2 "Cannot open \"$INPUT\""

[ -n "$1" ] && err 1 "Too many arguments"

[ ! -x "bench" ] && err 2 "Must be run from within the binary directory"

function bench ()
{
    local bin=$1 
    local desc="$2"
    echo -e "\n$desc" && time ./$bin < "$INPUT" > /dev/null
}

bench "bench" "C gets"
bench "pbench" "C++ std::getline"
bench "count" "FLEX scanner"
bench "gbench" "C GNU readline"
bench "$SRC/pb.py" "Python"
