#!/bin/bash

file="$1"
asset="${file%\.md}-asset"

echo $file $asset

hugo new content/post/"$file"
mkdir content/media/posts/"$asset"
