if status is-interactive
    source (starship init fish --print-full-init | psub)
    #fnm env --use-on-cd | source
    #fnm use default &>/dev/null
    # gopass completion fish | source
    #    fishline -s $status SIGSTATUS JOBS VFISH PWD GIT WRITE N ROOT
    atuin init fish | source
    #    eval "$(shelby init fish)"
end

if test -n "$TERM_PROGRAM"
    exec "$HOME/.local/bin/host-spawn"
end

source $HOME/.config/vars

# tabtab source for packages
# uninstall by removing these lines

# mimocode
fish_add_path /home/pmustafi/.mimocode/bin

# Added by GitButler installer
fish_add_path $HOME/.local/bin

# >>> localcan >>>
#set -gx PATH "/home/pmustafi/.localcan/bin" $PATH
# <<< localcan <<<

# Generated for envman. Do not edit.
test -s ~/.config/envman/load.fish; and source ~/.config/envman/load.fish

# nub
set -gx PATH "$HOME/.nub/bin" $PATH

# nub shims
set -gx PATH $HOME/.nub/shims $PATH
