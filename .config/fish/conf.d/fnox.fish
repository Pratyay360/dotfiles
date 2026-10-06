set -gx FNOX_SHELL fish

function fnox
    set command $argv[1]

    switch "$command"
        case deactivate shell
            eval (command /var/home/pmustafi/.cargo/bin/fnox "$command" $argv[2..-1])
        case '*'
            command /var/home/pmustafi/.cargo/bin/fnox "$command" $argv[2..-1]
    end
end

function __fnox_env_eval --on-event fish_prompt
    if test "$FNOX_SHELL" = "fish"
        eval (/var/home/pmustafi/.cargo/bin/fnox hook-env -s fish | string collect)
    end
end

function __fnox_cd_hook --on-variable PWD
    if test "$FNOX_SHELL" = "fish"
        __fnox_env_eval
    end
end
__fnox_env_eval
