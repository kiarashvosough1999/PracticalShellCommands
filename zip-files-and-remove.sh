#!/bin/bash
directory=$PWD

for file in "$directory"/*; do
	FILE="$(basename "${file}")"
	extension="${file##*.}"

	if [ "$extension" != "zip" ] && [ "$extension" != "" ] && [[ -f $FILE ]]; then
		zip "$FILE.zip" "$FILE"
		rm "$FILE"
	fi
done