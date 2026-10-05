if status is-interactive
    source (starship init fish --print-full-init | psub)
    #fnm env --use-on-cd | source
    #fnm use default &>/dev/null
    # gopass completion fish | source
    #    fishline -s $status SIGSTATUS JOBS VFISH PWD GIT WRITE N ROOT
    #    eval "$(shelby init fish)"
    atuin init fish | source
end


source $HOME/.config/vars

# tabtab source for packages
# uninstall by removing these lines


# Added by GitButler installer
fish_add_path $HOME/.local/bin

# >>> localcan >>>
#set -gx PATH "/home/pmustafi/.localcan/bin" $PATH
# <<< localcan <<<

# Generated for envman. Do not edit.
test -s ~/.config/envman/load.fish; and source ~/.config/envman/load.fish

# nub
set -gx PATH "$HOME/.nub/bin" $PATH

# kilo
fish_add_path /home/pmustafi/.kilo/bin

# string match -q "$TERM_PROGRAM" "kiro" and . (kiro --locate-shell-integration-path fish)
export LD_LIBRARY_PATH="$HOME/.local/clang/lib:$LD_LIBRARY_PATH"

# >>> stick notes startup >>>
if status is-interactive; and type -q stick
    stick startup
end
# <<< stick notes startup <<<

# toolbox-export: add exported binaries to PATH
if not contains $HOME/.local/toolbox $PATH
    set -gx PATH $PATH $HOME/.local/toolbox
end
