# Implicit "cd"
shopt -s autocd

# Disable the screen lock to use incremental search with Ctrl+S instead
stty stop undef

# User-installed binaries
export PATH="${PATH}:$HOME/.local/bin/"
