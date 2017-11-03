#!/bin/sh

tmp=${TMPDIR:-/tmp}/ins.$$   # Create a temporary file
trap "rm -f $tmp; exit 1" 0 1 2 3 13 15

header=`cat ../header.txt`
footer=`cat ../footer.txt`

for file in "$@"
do
    {
    echo "$header"
    cat $file
	echo "$footer"
    } > $tmp
    mv $tmp $file
done

rm -f $tmp
trap 0