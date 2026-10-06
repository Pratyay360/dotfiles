# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH
eval "$(fnox completion bash)"
# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc
### bling.sh source start
# test -f /usr/share/ublue-os/bling/bling.sh && source /usr/share/ublue-os/bling/bling.sh
### bling.sh source end
. "$HOME/.cargo/env"
eval "$(pixi completion --shell bash)"
eval "$(rbw gen-completions bash)"
#[[ "$TERM_PROGRAM" == "kiro" ]] &&
#. "$(kiro --locate-shell-integration-path bash)"
eval "$(zoxide init bash)"
export PATH="/home/pmustafi/.pixi/bin:$PATH"
eval "$(doppler completion bash)"
. "$HOME/.atuin/bin/env"
[[ -f ~/.bash-preexec.sh ]] && source ~/.bash-preexec.sh
eval "$(atuin init bash)"
# ~/.bash_profile or ~/.bash_login or ~/.profile
eval "$(mise activate bash --shims)"
eval "$(oh-my-posh init bash --config ~/.amro.omp.json)"
[[ "$TERM_PROGRAM" == "kiro" ]] && . "$(kiro --locate-shell-integration-path bash)"
eval "$(/home/pmustafi/.config/.bash_secrets)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
