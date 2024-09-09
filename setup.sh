#!/bin/bash

# Directory containing the dotfiles
dotfiles_dir="$(dirname "$0")"

# Home directory
home_dir="$HOME"

# Iterate over all files starting with .
for file in "$dotfiles_dir"/.*; do
    # Exclude . and ..
    if [[ "$file" != "$dotfiles_dir/." && "$file" != "$dotfiles_dir/.." ]]; then
        # Create symlink in the home directory
        ln -s "$file" "$home_dir/$(basename "$file")"
    fi
done

# Function to append variable to bashrc file
append_to_bashrc() {
    local variable_name="$1"
    echo ". $variable_name" >> "$home_dir/.bashrc"
}

append_to_bashrc ".show_git_branch"
