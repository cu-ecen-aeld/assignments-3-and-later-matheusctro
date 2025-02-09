#!/bin/sh

filesdir=$1
searchstr=$2

if [ -z $filesdir ]; then
    echo "Missing argument: files directory"
    exit 1
fi

if [ -z $searchstr ]; then
    echo "Missing argument: search string"
    exit 1
fi

if [ ! -d "$filesdir" ]; then
    echo "Files directory is not a directory"
    exit 1
fi

X=$(find $filesdir -type f | wc -l)
Y=$(grep -ro $searchstr $filesdir | wc -l)

echo "The number of files are $X and the number of matching lines are $Y"