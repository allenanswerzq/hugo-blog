#!/bin/bash

type="$1"
file="$2"
asset="${file%\.md}-asset"

echo $type $file $asset

hugo new content/"$type"/"$file"
mkdir -p content/media/"$type"/"$asset"
