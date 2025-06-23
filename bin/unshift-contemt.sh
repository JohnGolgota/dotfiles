#!/bin/bash

content="$1"
file="$2"

temp_file=$(mktemp)

echo "$content" > "$temp_file"
cat "$file" >> "$temp_file"

mv "$temp_file" "$file"
