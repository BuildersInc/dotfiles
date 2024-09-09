#!/bin/bash

# Directory containing the dotfiles
dotfiles_dir="$(dirname "$0")"

# Home directory
home_dir="$HOME"
# Iterate over all files starting with .
for file in "$dotfiles_dir"/.*; do
    # Exclude . and ..
    if [[ "$file" != "$dotfiles_dir/." && "$file" != "$dotfiles_dir/.." ]]; then
        # Check if file is not a folder
        if [[ ! -d "$file" ]]; then
            # Create symlink in the home directory
            ln -s "$file" "$home_dir/$(basename "$file")"
        fi
    fi
done

export_file_into_bashrc() {
    local variable_name="$1"
    echo ". .$variable_name" >> "$home_dir/.bashrc"
}

export_file_into_bashrc ".show_git_branch"
