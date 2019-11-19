#!/bin/bash
PROJ=/home/project
cd $PROJ 	
find $PROJ/dir1/* $PROJ/dir2/*          \
    -type f -name "*.c" -print -o       \
    -type f -name "*.h" -print -o       \
    -type f -name "*.cc" -print -o      \
    -type f -name "*.hh" -print > $PROJ/cscope.files 

cscope -b -q -k 1>/dev/null 2>&1
