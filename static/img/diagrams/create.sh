#!/bin/bash

touch "$1".erasercode
git add "$1".erasercode

touch "$1".svg
git add "$1".svg

title=$(echo "$1" | sed 's/\([a-z]\)\([A-Z]\)/\1 \2/g')
echo "![$title](/img/diagrams/$1.svg)"