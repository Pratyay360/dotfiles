if status is-interactive
    atuin init fish | source
end
fnm env --use-on-cd | source
fnm use default &>/dev/null
function fish_prompt
    fishline -s $status SIGSTATUS JOBS VFISH PWD GIT WRITE N ROOT
end
fnox completion fish | source
# starship init fish | source
zoxide init fish | source
eval "$(brew shellenv fish)"
if status is-interactive
    mise activate fish | source
else
    mise activate fish --shims | source
end
oh-my-posh init fish --config ~/.amro.omp.json | source
uv generate-shell-completion fish | source
#oh-my-posh init fish --config ~/.local/atomic.omp.json | fish
#zb completion fish | source
# string match -q "$TERM_PROGRAM" "kiro" and . (kiro --locate-shell-integration-path fish)
rbw gen-completions fish | source
fish_add_path /home/pmustafi/.opencode/bin
eval "$(/home/pmustafi/.config/.bash_secrets)"
