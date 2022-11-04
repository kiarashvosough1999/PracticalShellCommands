#!/bin/bash
directory=$PWD

for file in "$directory"/*; do
	FILE="$(basename "${file}")"
	extension="${file##*.}"

	if [ "$extension" != "zip" ] && [ "$extension" != "" ] && [[ -f $FILE ]]; then
		zip "$FILE.zip" "$FILE"
		rm "$FILE"
	elif [ "$extension" != "zip" ] && [[ -d $FILE ]]; then
		zip -r "$FILE.zip" "$FILE"
		rm -rf "$FILE"
	else
		continue
	fi
done