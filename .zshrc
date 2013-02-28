[ -z "$PS1" ] && return

# Load all plugins in ~/.zsh
find ~/.zsh/* -type f -maxdepth 0 | while read plugin; do
    source $plugin
done

