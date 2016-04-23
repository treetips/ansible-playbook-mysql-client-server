# .bash_profile
# {{ ansible_managed }}

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# User specific environment and startup programs
if [ -d "${HOME}/.bash.d" ] ; then
    for f in "${HOME}"/.bash.d/*.sh ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
else
    echo "~/.bash.d is not found."
fi

PATH=$PATH:$HOME/.local/bin:$HOME/bin

export PATH