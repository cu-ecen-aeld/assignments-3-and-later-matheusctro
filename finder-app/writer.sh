writefile=$1
writestr=$2

if [ -z $writefile ]; then
    echo "Missing argument: full path filename"
    exit 1
fi

if [ -z $writestr ]; then
    echo "Missing argument: write string"
    exit 1
fi

touch "$writefile" 2>/dev/null

if [ $? -ne 0 ]; then
    echo "File could not be created"
    exit 1
fi

echo "$writestr" > $writefile