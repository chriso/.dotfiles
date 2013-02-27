[ -z "$PS1" ] && return

# Load all plugins in ~/.zsh
find ~/.zsh/* -maxdepth 0 -type f | while read plugin; do
    source $plugin
done

