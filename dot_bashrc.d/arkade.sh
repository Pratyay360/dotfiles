# bash completion for arkade                               -*- shell-script -*-

__arkade_debug()
{
    if [[ -n ${BASH_COMP_DEBUG_FILE:-} ]]; then
        echo "$*" >> "${BASH_COMP_DEBUG_FILE}"
    fi
}

# Homebrew on Macs have version 1.3 of bash-completion which doesn't include
# _init_completion. This is a very minimal version of that function.
__arkade_init_completion()
{
    COMPREPLY=()
    _get_comp_words_by_ref "$@" cur prev words cword
}

__arkade_index_of_word()
{
    local w word=$1
    shift
    index=0
    for w in "$@"; do
        [[ $w = "$word" ]] && return
        index=$((index+1))
    done
    index=-1
}

__arkade_contains_word()
{
    local w word=$1; shift
    for w in "$@"; do
        [[ $w = "$word" ]] && return
    done
    return 1
}

__arkade_handle_go_custom_completion()
{
    __arkade_debug "${FUNCNAME[0]}: cur is ${cur}, words[*] is ${words[*]}, #words[@] is ${#words[@]}"

    local shellCompDirectiveError=1
    local shellCompDirectiveNoSpace=2
    local shellCompDirectiveNoFileComp=4
    local shellCompDirectiveFilterFileExt=8
    local shellCompDirectiveFilterDirs=16

    local out requestComp lastParam lastChar comp directive args

    # Prepare the command to request completions for the program.
    # Calling ${words[0]} instead of directly arkade allows handling aliases
    args=("${words[@]:1}")
    # Disable ActiveHelp which is not supported for bash completion v1
    requestComp="ARKADE_ACTIVE_HELP=0 ${words[0]} __completeNoDesc ${args[*]}"

    lastParam=${words[$((${#words[@]}-1))]}
    lastChar=${lastParam:$((${#lastParam}-1)):1}
    __arkade_debug "${FUNCNAME[0]}: lastParam ${lastParam}, lastChar ${lastChar}"

    if [ -z "${cur}" ] && [ "${lastChar}" != "=" ]; then
        # If the last parameter is complete (there is a space following it)
        # We add an extra empty parameter so we can indicate this to the go method.
        __arkade_debug "${FUNCNAME[0]}: Adding extra empty parameter"
        requestComp="${requestComp} \"\""
    fi

    __arkade_debug "${FUNCNAME[0]}: calling ${requestComp}"
    # Use eval to handle any environment variables and such
    out=$(eval "${requestComp}" 2>/dev/null)

    # Extract the directive integer at the very end of the output following a colon (:)
    directive=${out##*:}
    # Remove the directive
    out=${out%:*}
    if [ "${directive}" = "${out}" ]; then
        # There is not directive specified
        directive=0
    fi
    __arkade_debug "${FUNCNAME[0]}: the completion directive is: ${directive}"
    __arkade_debug "${FUNCNAME[0]}: the completions are: ${out}"

    if [ $((directive & shellCompDirectiveError)) -ne 0 ]; then
        # Error code.  No completion.
        __arkade_debug "${FUNCNAME[0]}: received error from custom completion go code"
        return
    else
        if [ $((directive & shellCompDirectiveNoSpace)) -ne 0 ]; then
            if [[ $(type -t compopt) = "builtin" ]]; then
                __arkade_debug "${FUNCNAME[0]}: activating no space"
                compopt -o nospace
            fi
        fi
        if [ $((directive & shellCompDirectiveNoFileComp)) -ne 0 ]; then
            if [[ $(type -t compopt) = "builtin" ]]; then
                __arkade_debug "${FUNCNAME[0]}: activating no file completion"
                compopt +o default
            fi
        fi
    fi

    if [ $((directive & shellCompDirectiveFilterFileExt)) -ne 0 ]; then
        # File extension filtering
        local fullFilter filter filteringCmd
        # Do not use quotes around the $out variable or else newline
        # characters will be kept.
        for filter in ${out}; do
            fullFilter+="$filter|"
        done

        filteringCmd="_filedir $fullFilter"
        __arkade_debug "File filtering command: $filteringCmd"
        $filteringCmd
    elif [ $((directive & shellCompDirectiveFilterDirs)) -ne 0 ]; then
        # File completion for directories only
        local subdir
        # Use printf to strip any trailing newline
        subdir=$(printf "%s" "${out}")
        if [ -n "$subdir" ]; then
            __arkade_debug "Listing directories in $subdir"
            __arkade_handle_subdirs_in_dir_flag "$subdir"
        else
            __arkade_debug "Listing directories in ."
            _filedir -d
        fi
    else
        while IFS='' read -r comp; do
            COMPREPLY+=("$comp")
        done < <(compgen -W "${out}" -- "$cur")
    fi
}

__arkade_handle_reply()
{
    __arkade_debug "${FUNCNAME[0]}"
    local comp
    case $cur in
        -*)
            if [[ $(type -t compopt) = "builtin" ]]; then
                compopt -o nospace
            fi
            local allflags
            if [ ${#must_have_one_flag[@]} -ne 0 ]; then
                allflags=("${must_have_one_flag[@]}")
            else
                allflags=("${flags[*]} ${two_word_flags[*]}")
            fi
            while IFS='' read -r comp; do
                COMPREPLY+=("$comp")
            done < <(compgen -W "${allflags[*]}" -- "$cur")
            if [[ $(type -t compopt) = "builtin" ]]; then
                [[ "${COMPREPLY[0]}" == *= ]] || compopt +o nospace
            fi

            # complete after --flag=abc
            if [[ $cur == *=* ]]; then
                if [[ $(type -t compopt) = "builtin" ]]; then
                    compopt +o nospace
                fi

                local index flag
                flag="${cur%=*}"
                __arkade_index_of_word "${flag}" "${flags_with_completion[@]}"
                COMPREPLY=()
                if [[ ${index} -ge 0 ]]; then
                    PREFIX=""
                    cur="${cur#*=}"
                    ${flags_completion[${index}]}
                    if [ -n "${ZSH_VERSION:-}" ]; then
                        # zsh completion needs --flag= prefix
                        eval "COMPREPLY=( \"\${COMPREPLY[@]/#/${flag}=}\" )"
                    fi
                fi
            fi

            if [[ -z "${flag_parsing_disabled}" ]]; then
                # If flag parsing is enabled, we have completed the flags and can return.
                # If flag parsing is disabled, we may not know all (or any) of the flags, so we fallthrough
                # to possibly call handle_go_custom_completion.
                return 0;
            fi
            ;;
    esac

    # check if we are handling a flag with special work handling
    local index
    __arkade_index_of_word "${prev}" "${flags_with_completion[@]}"
    if [[ ${index} -ge 0 ]]; then
        ${flags_completion[${index}]}
        return
    fi

    # we are parsing a flag and don't have a special handler, no completion
    if [[ ${cur} != "${words[cword]}" ]]; then
        return
    fi

    local completions
    completions=("${commands[@]}")
    if [[ ${#must_have_one_noun[@]} -ne 0 ]]; then
        completions+=("${must_have_one_noun[@]}")
    elif [[ -n "${has_completion_function}" ]]; then
        # if a go completion function is provided, defer to that function
        __arkade_handle_go_custom_completion
    fi
    if [[ ${#must_have_one_flag[@]} -ne 0 ]]; then
        completions+=("${must_have_one_flag[@]}")
    fi
    while IFS='' read -r comp; do
        COMPREPLY+=("$comp")
    done < <(compgen -W "${completions[*]}" -- "$cur")

    if [[ ${#COMPREPLY[@]} -eq 0 && ${#noun_aliases[@]} -gt 0 && ${#must_have_one_noun[@]} -ne 0 ]]; then
        while IFS='' read -r comp; do
            COMPREPLY+=("$comp")
        done < <(compgen -W "${noun_aliases[*]}" -- "$cur")
    fi

    if [[ ${#COMPREPLY[@]} -eq 0 ]]; then
        if declare -F __arkade_custom_func >/dev/null; then
            # try command name qualified custom func
            __arkade_custom_func
        else
            # otherwise fall back to unqualified for compatibility
            declare -F __custom_func >/dev/null && __custom_func
        fi
    fi

    # available in bash-completion >= 2, not always present on macOS
    if declare -F __ltrim_colon_completions >/dev/null; then
        __ltrim_colon_completions "$cur"
    fi

    # If there is only 1 completion and it is a flag with an = it will be completed
    # but we don't want a space after the =
    if [[ "${#COMPREPLY[@]}" -eq "1" ]] && [[ $(type -t compopt) = "builtin" ]] && [[ "${COMPREPLY[0]}" == --*= ]]; then
       compopt -o nospace
    fi
}

# The arguments should be in the form "ext1|ext2|extn"
__arkade_handle_filename_extension_flag()
{
    local ext="$1"
    _filedir "@(${ext})"
}

__arkade_handle_subdirs_in_dir_flag()
{
    local dir="$1"
    pushd "${dir}" >/dev/null 2>&1 && _filedir -d && popd >/dev/null 2>&1 || return
}

__arkade_handle_flag()
{
    __arkade_debug "${FUNCNAME[0]}: c is $c words[c] is ${words[c]}"

    # if a command required a flag, and we found it, unset must_have_one_flag()
    local flagname=${words[c]}
    local flagvalue=""
    # if the word contained an =
    if [[ ${words[c]} == *"="* ]]; then
        flagvalue=${flagname#*=} # take in as flagvalue after the =
        flagname=${flagname%=*} # strip everything after the =
        flagname="${flagname}=" # but put the = back
    fi
    __arkade_debug "${FUNCNAME[0]}: looking for ${flagname}"
    if __arkade_contains_word "${flagname}" "${must_have_one_flag[@]}"; then
        must_have_one_flag=()
    fi

    # if you set a flag which only applies to this command, don't show subcommands
    if __arkade_contains_word "${flagname}" "${local_nonpersistent_flags[@]}"; then
      commands=()
    fi

    # keep flag value with flagname as flaghash
    # flaghash variable is an associative array which is only supported in bash > 3.
    if [[ -z "${BASH_VERSION:-}" || "${BASH_VERSINFO[0]:-}" -gt 3 ]]; then
        if [ -n "${flagvalue}" ] ; then
            flaghash[${flagname}]=${flagvalue}
        elif [ -n "${words[ $((c+1)) ]}" ] ; then
            flaghash[${flagname}]=${words[ $((c+1)) ]}
        else
            flaghash[${flagname}]="true" # pad "true" for bool flag
        fi
    fi

    # skip the argument to a two word flag
    if [[ ${words[c]} != *"="* ]] && __arkade_contains_word "${words[c]}" "${two_word_flags[@]}"; then
        __arkade_debug "${FUNCNAME[0]}: found a flag ${words[c]}, skip the next argument"
        c=$((c+1))
        # if we are looking for a flags value, don't show commands
        if [[ $c -eq $cword ]]; then
            commands=()
        fi
    fi

    c=$((c+1))

}

__arkade_handle_noun()
{
    __arkade_debug "${FUNCNAME[0]}: c is $c words[c] is ${words[c]}"

    if __arkade_contains_word "${words[c]}" "${must_have_one_noun[@]}"; then
        must_have_one_noun=()
    elif __arkade_contains_word "${words[c]}" "${noun_aliases[@]}"; then
        must_have_one_noun=()
    fi

    nouns+=("${words[c]}")
    c=$((c+1))
}

__arkade_handle_command()
{
    __arkade_debug "${FUNCNAME[0]}: c is $c words[c] is ${words[c]}"

    local next_command
    if [[ -n ${last_command} ]]; then
        next_command="_${last_command}_${words[c]//:/__}"
    else
        if [[ $c -eq 0 ]]; then
            next_command="_arkade_root_command"
        else
            next_command="_${words[c]//:/__}"
        fi
    fi
    c=$((c+1))
    __arkade_debug "${FUNCNAME[0]}: looking for ${next_command}"
    declare -F "$next_command" >/dev/null && $next_command
}

__arkade_handle_word()
{
    if [[ $c -ge $cword ]]; then
        __arkade_handle_reply
        return
    fi
    __arkade_debug "${FUNCNAME[0]}: c is $c words[c] is ${words[c]}"
    if [[ "${words[c]}" == -* ]]; then
        __arkade_handle_flag
    elif __arkade_contains_word "${words[c]}" "${commands[@]}"; then
        __arkade_handle_command
    elif [[ $c -eq 0 ]]; then
        __arkade_handle_command
    elif __arkade_contains_word "${words[c]}" "${command_aliases[@]}"; then
        # aliashash variable is an associative array which is only supported in bash > 3.
        if [[ -z "${BASH_VERSION:-}" || "${BASH_VERSINFO[0]:-}" -gt 3 ]]; then
            words[c]=${aliashash[${words[c]}]}
            __arkade_handle_command
        else
            __arkade_handle_noun
        fi
    else
        __arkade_handle_noun
    fi
    __arkade_handle_word
}

_arkade_chart_bump()
{
    last_command="arkade_chart_bump"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--file=")
    two_word_flags+=("--file")
    two_word_flags+=("-f")
    local_nonpersistent_flags+=("--file")
    local_nonpersistent_flags+=("--file=")
    local_nonpersistent_flags+=("-f")
    flags+=("--force")
    local_nonpersistent_flags+=("--force")
    flags+=("--verbose")
    flags+=("-v")
    local_nonpersistent_flags+=("--verbose")
    local_nonpersistent_flags+=("-v")
    flags+=("--write")
    flags+=("-w")
    local_nonpersistent_flags+=("--write")
    local_nonpersistent_flags+=("-w")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_arkade_chart_upgrade()
{
    last_command="arkade_chart_upgrade"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--depth=")
    two_word_flags+=("--depth")
    two_word_flags+=("-d")
    local_nonpersistent_flags+=("--depth")
    local_nonpersistent_flags+=("--depth=")
    local_nonpersistent_flags+=("-d")
    flags+=("--file=")
    two_word_flags+=("--file")
    two_word_flags+=("-f")
    local_nonpersistent_flags+=("--file")
    local_nonpersistent_flags+=("--file=")
    local_nonpersistent_flags+=("-f")
    flags+=("--ignore-file=")
    two_word_flags+=("--ignore-file")
    two_word_flags+=("-i")
    local_nonpersistent_flags+=("--ignore-file")
    local_nonpersistent_flags+=("--ignore-file=")
    local_nonpersistent_flags+=("-i")
    flags+=("--verbose")
    flags+=("-v")
    local_nonpersistent_flags+=("--verbose")
    local_nonpersistent_flags+=("-v")
    flags+=("--workers=")
    two_word_flags+=("--workers")
    two_word_flags+=("-c")
    local_nonpersistent_flags+=("--workers")
    local_nonpersistent_flags+=("--workers=")
    local_nonpersistent_flags+=("-c")
    flags+=("--write")
    flags+=("-w")
    local_nonpersistent_flags+=("--write")
    local_nonpersistent_flags+=("-w")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_arkade_chart_verify()
{
    last_command="arkade_chart_verify"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--depth=")
    two_word_flags+=("--depth")
    two_word_flags+=("-d")
    local_nonpersistent_flags+=("--depth")
    local_nonpersistent_flags+=("--depth=")
    local_nonpersistent_flags+=("-d")
    flags+=("--file=")
    two_word_flags+=("--file")
    two_word_flags+=("-f")
    local_nonpersistent_flags+=("--file")
    local_nonpersistent_flags+=("--file=")
    local_nonpersistent_flags+=("-f")
    flags+=("--verbose")
    flags+=("-v")
    local_nonpersistent_flags+=("--verbose")
    local_nonpersistent_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_arkade_chart()
{
    last_command="arkade_chart"

    command_aliases=()

    commands=()
    commands+=("bump")
    commands+=("upgrade")
    commands+=("verify")

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()


    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_arkade_completion()
{
    last_command="arkade_completion"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--help")
    flags+=("-h")
    local_nonpersistent_flags+=("--help")
    local_nonpersistent_flags+=("-h")

    must_have_one_flag=()
    must_have_one_noun=()
    must_have_one_noun+=("bash")
    must_have_one_noun+=("zsh")
    noun_aliases=()
}

_arkade_docker_gen()
{
    last_command="arkade_docker_gen"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--stdout")
    flags+=("-s")
    local_nonpersistent_flags+=("--stdout")
    local_nonpersistent_flags+=("-s")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_arkade_docker_upgrade()
{
    last_command="arkade_docker_upgrade"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--image=")
    two_word_flags+=("--image")
    two_word_flags+=("-i")
    local_nonpersistent_flags+=("--image")
    local_nonpersistent_flags+=("--image=")
    local_nonpersistent_flags+=("-i")
    flags+=("--pin-major-minor=")
    two_word_flags+=("--pin-major-minor")
    local_nonpersistent_flags+=("--pin-major-minor")
    local_nonpersistent_flags+=("--pin-major-minor=")
    flags+=("--verbose")
    flags+=("-v")
    local_nonpersistent_flags+=("--verbose")
    local_nonpersistent_flags+=("-v")
    flags+=("--write")
    flags+=("-w")
    local_nonpersistent_flags+=("--write")
    local_nonpersistent_flags+=("-w")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_arkade_docker()
{
    last_command="arkade_docker"

    command_aliases=()

    commands=()
    commands+=("gen")
    commands+=("upgrade")
    if [[ -z "${BASH_VERSION:-}" || "${BASH_VERSINFO[0]:-}" -gt 3 ]]; then
        command_aliases+=("u")
        aliashash["u"]="upgrade"
    fi

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()


    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_arkade_fstail()
{
    last_command="arkade_fstail"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--no-prefix")
    local_nonpersistent_flags+=("--no-prefix")
    flags+=("--prefix=")
    two_word_flags+=("--prefix")
    local_nonpersistent_flags+=("--prefix")
    local_nonpersistent_flags+=("--prefix=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_arkade_get()
{
    last_command="arkade_get"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--arch=")
    two_word_flags+=("--arch")
    local_nonpersistent_flags+=("--arch")
    local_nonpersistent_flags+=("--arch=")
    flags+=("--format=")
    two_word_flags+=("--format")
    two_word_flags+=("-o")
    local_nonpersistent_flags+=("--format")
    local_nonpersistent_flags+=("--format=")
    local_nonpersistent_flags+=("-o")
    flags+=("--os=")
    two_word_flags+=("--os")
    local_nonpersistent_flags+=("--os")
    local_nonpersistent_flags+=("--os=")
    flags+=("--parallel=")
    two_word_flags+=("--parallel")
    two_word_flags+=("-p")
    local_nonpersistent_flags+=("--parallel")
    local_nonpersistent_flags+=("--parallel=")
    local_nonpersistent_flags+=("-p")
    flags+=("--path=")
    two_word_flags+=("--path")
    local_nonpersistent_flags+=("--path")
    local_nonpersistent_flags+=("--path=")
    flags+=("--progress")
    local_nonpersistent_flags+=("--progress")
    flags+=("--quiet")
    local_nonpersistent_flags+=("--quiet")
    flags+=("--verify")
    local_nonpersistent_flags+=("--verify")
    flags+=("--version=")
    two_word_flags+=("--version")
    two_word_flags+=("-v")
    local_nonpersistent_flags+=("--version")
    local_nonpersistent_flags+=("--version=")
    local_nonpersistent_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("")
    must_have_one_noun+=("act")
    must_have_one_noun+=("actions-usage")
    must_have_one_noun+=("actuated-cli")
    must_have_one_noun+=("age")
    must_have_one_noun+=("age-keygen")
    must_have_one_noun+=("alloy")
    must_have_one_noun+=("amp")
    must_have_one_noun+=("argo")
    must_have_one_noun+=("argocd")
    must_have_one_noun+=("argocd-autopilot")
    must_have_one_noun+=("arkade")
    must_have_one_noun+=("atuin")
    must_have_one_noun+=("autok3s")
    must_have_one_noun+=("buildx")
    must_have_one_noun+=("bun")
    must_have_one_noun+=("butane")
    must_have_one_noun+=("caddy")
    must_have_one_noun+=("ch-remote")
    must_have_one_noun+=("cilium")
    must_have_one_noun+=("civo")
    must_have_one_noun+=("claude")
    must_have_one_noun+=("cloud-hypervisor")
    must_have_one_noun+=("clusterawsadm")
    must_have_one_noun+=("clusterctl")
    must_have_one_noun+=("cmctl")
    must_have_one_noun+=("codex")
    must_have_one_noun+=("conftest")
    must_have_one_noun+=("consul")
    must_have_one_noun+=("copa")
    must_have_one_noun+=("copilot")
    must_have_one_noun+=("cosign")
    must_have_one_noun+=("cr")
    must_have_one_noun+=("crane")
    must_have_one_noun+=("crc")
    must_have_one_noun+=("croc")
    must_have_one_noun+=("crossplane")
    must_have_one_noun+=("crush")
    must_have_one_noun+=("dagger")
    must_have_one_noun+=("devpod")
    must_have_one_noun+=("devspace")
    must_have_one_noun+=("direnv")
    must_have_one_noun+=("discord-updater")
    must_have_one_noun+=("dive")
    must_have_one_noun+=("docker-compose")
    must_have_one_noun+=("doctl")
    must_have_one_noun+=("dotenv-linter")
    must_have_one_noun+=("dufs")
    must_have_one_noun+=("duplik8s")
    must_have_one_noun+=("dyff")
    must_have_one_noun+=("eks-node-viewer")
    must_have_one_noun+=("eksctl")
    must_have_one_noun+=("eksctl-anywhere")
    must_have_one_noun+=("etcd")
    must_have_one_noun+=("faas-cli")
    must_have_one_noun+=("fd")
    must_have_one_noun+=("firectl")
    must_have_one_noun+=("flux")
    must_have_one_noun+=("flyctl")
    must_have_one_noun+=("fstail")
    must_have_one_noun+=("fzf")
    must_have_one_noun+=("gh")
    must_have_one_noun+=("gha-bump")
    must_have_one_noun+=("git-who")
    must_have_one_noun+=("glab")
    must_have_one_noun+=("glow")
    must_have_one_noun+=("golangci-lint")
    must_have_one_noun+=("gomplate")
    must_have_one_noun+=("goreleaser")
    must_have_one_noun+=("gptscript")
    must_have_one_noun+=("grafana-agent")
    must_have_one_noun+=("grype")
    must_have_one_noun+=("hadolint")
    must_have_one_noun+=("helm")
    must_have_one_noun+=("helmfile")
    must_have_one_noun+=("hey")
    must_have_one_noun+=("hostctl")
    must_have_one_noun+=("hubble")
    must_have_one_noun+=("hugo")
    must_have_one_noun+=("influx")
    must_have_one_noun+=("inlets-pro")
    must_have_one_noun+=("inletsctl")
    must_have_one_noun+=("istioctl")
    must_have_one_noun+=("jg")
    must_have_one_noun+=("jq")
    must_have_one_noun+=("just")
    must_have_one_noun+=("k0s")
    must_have_one_noun+=("k0sctl")
    must_have_one_noun+=("k3d")
    must_have_one_noun+=("k3s")
    must_have_one_noun+=("k3sup")
    must_have_one_noun+=("k6")
    must_have_one_noun+=("k9s")
    must_have_one_noun+=("kail")
    must_have_one_noun+=("keploy")
    must_have_one_noun+=("kgctl")
    must_have_one_noun+=("kim")
    must_have_one_noun+=("kind")
    must_have_one_noun+=("kluctl")
    must_have_one_noun+=("ko")
    must_have_one_noun+=("kops")
    must_have_one_noun+=("krew")
    must_have_one_noun+=("ktop")
    must_have_one_noun+=("kube-bench")
    must_have_one_noun+=("kube-burner")
    must_have_one_noun+=("kube-linter")
    must_have_one_noun+=("kube-score")
    must_have_one_noun+=("kubebuilder")
    must_have_one_noun+=("kubecm")
    must_have_one_noun+=("kubecolor")
    must_have_one_noun+=("kubeconform")
    must_have_one_noun+=("kubectl")
    must_have_one_noun+=("kubectx")
    must_have_one_noun+=("kubelogin")
    must_have_one_noun+=("kubens")
    must_have_one_noun+=("kubescape")
    must_have_one_noun+=("kubeseal")
    must_have_one_noun+=("kubetail")
    must_have_one_noun+=("kubetrim")
    must_have_one_noun+=("kubeval")
    must_have_one_noun+=("kubie")
    must_have_one_noun+=("kumactl")
    must_have_one_noun+=("kustomize")
    must_have_one_noun+=("kwok")
    must_have_one_noun+=("kwokctl")
    must_have_one_noun+=("kyverno")
    must_have_one_noun+=("labctl")
    must_have_one_noun+=("lazydocker")
    must_have_one_noun+=("lazygit")
    must_have_one_noun+=("linkerd2")
    must_have_one_noun+=("logcli")
    must_have_one_noun+=("mc")
    must_have_one_noun+=("mediamtx")
    must_have_one_noun+=("metal")
    must_have_one_noun+=("minikube")
    must_have_one_noun+=("mixctl")
    must_have_one_noun+=("mkcert")
    must_have_one_noun+=("nats")
    must_have_one_noun+=("nats-server")
    must_have_one_noun+=("nerdctl")
    must_have_one_noun+=("node_exporter")
    must_have_one_noun+=("nova")
    must_have_one_noun+=("nu")
    must_have_one_noun+=("oc")
    must_have_one_noun+=("oh-my-posh")
    must_have_one_noun+=("op")
    must_have_one_noun+=("opa")
    must_have_one_noun+=("opencode")
    must_have_one_noun+=("openshift-install")
    must_have_one_noun+=("operator-sdk")
    must_have_one_noun+=("opkssh")
    must_have_one_noun+=("oras")
    must_have_one_noun+=("osm")
    must_have_one_noun+=("pack")
    must_have_one_noun+=("packer")
    must_have_one_noun+=("pluto")
    must_have_one_noun+=("polaris")
    must_have_one_noun+=("popeye")
    must_have_one_noun+=("porter")
    must_have_one_noun+=("promtool")
    must_have_one_noun+=("pulumi")
    must_have_one_noun+=("rclone")
    must_have_one_noun+=("regctl")
    must_have_one_noun+=("rekor-cli")
    must_have_one_noun+=("replicated")
    must_have_one_noun+=("restic")
    must_have_one_noun+=("rg")
    must_have_one_noun+=("rosa")
    must_have_one_noun+=("rpk")
    must_have_one_noun+=("run-job")
    must_have_one_noun+=("scaleway-cli")
    must_have_one_noun+=("seaweedfs")
    must_have_one_noun+=("skupper")
    must_have_one_noun+=("snowmachine")
    must_have_one_noun+=("sops")
    must_have_one_noun+=("ssync")
    must_have_one_noun+=("starship")
    must_have_one_noun+=("step")
    must_have_one_noun+=("stern")
    must_have_one_noun+=("syft")
    must_have_one_noun+=("talosctl")
    must_have_one_noun+=("task")
    must_have_one_noun+=("temporal")
    must_have_one_noun+=("terraform")
    must_have_one_noun+=("terraform-docs")
    must_have_one_noun+=("terragrunt")
    must_have_one_noun+=("terrascan")
    must_have_one_noun+=("tflint")
    must_have_one_noun+=("tfsec")
    must_have_one_noun+=("tilt")
    must_have_one_noun+=("timoni")
    must_have_one_noun+=("tkn")
    must_have_one_noun+=("tofu")
    must_have_one_noun+=("trivy")
    must_have_one_noun+=("vagrant")
    must_have_one_noun+=("vault")
    must_have_one_noun+=("vcluster")
    must_have_one_noun+=("vhs")
    must_have_one_noun+=("viddy")
    must_have_one_noun+=("waypoint")
    must_have_one_noun+=("websocat")
    must_have_one_noun+=("xq")
    must_have_one_noun+=("yq")
    must_have_one_noun+=("yt-dlp")
    noun_aliases=()
}

_arkade_gha_bump()
{
    last_command="arkade_gha_bump"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--file=")
    two_word_flags+=("--file")
    two_word_flags+=("-f")
    local_nonpersistent_flags+=("--file")
    local_nonpersistent_flags+=("--file=")
    local_nonpersistent_flags+=("-f")
    flags+=("--verbose")
    flags+=("-v")
    local_nonpersistent_flags+=("--verbose")
    local_nonpersistent_flags+=("-v")
    flags+=("--write")
    flags+=("-w")
    local_nonpersistent_flags+=("--write")
    local_nonpersistent_flags+=("-w")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_arkade_gha()
{
    last_command="arkade_gha"

    command_aliases=()

    commands=()
    commands+=("bump")
    if [[ -z "${BASH_VERSION:-}" || "${BASH_VERSINFO[0]:-}" -gt 3 ]]; then
        command_aliases+=("u")
        aliashash["u"]="bump"
    fi

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()


    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_arkade_help()
{
    last_command="arkade_help"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()


    must_have_one_flag=()
    must_have_one_noun=()
    has_completion_function=1
    noun_aliases=()
}

_arkade_info()
{
    last_command="arkade_info"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()


    must_have_one_flag=()
    must_have_one_noun=()
    has_completion_function=1
    noun_aliases=()
}

_arkade_install_argocd()
{
    last_command="arkade_install_argocd"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--kubeconfig=")
    two_word_flags+=("--kubeconfig")
    flags+=("--wait")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_arkade_install_cassandra()
{
    last_command="arkade_install_cassandra"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--namespace=")
    two_word_flags+=("--namespace")
    two_word_flags+=("-n")
    local_nonpersistent_flags+=("--namespace")
    local_nonpersistent_flags+=("--namespace=")
    local_nonpersistent_flags+=("-n")
    flags+=("--persistence")
    local_nonpersistent_flags+=("--persistence")
    flags+=("--set=")
    two_word_flags+=("--set")
    local_nonpersistent_flags+=("--set")
    local_nonpersistent_flags+=("--set=")
    flags+=("--update-repo")
    local_nonpersistent_flags+=("--update-repo")
    flags+=("--kubeconfig=")
    two_word_flags+=("--kubeconfig")
    flags+=("--wait")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_arkade_install_cert-manager()
{
    last_command="arkade_install_cert-manager"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--dns-server=")
    two_word_flags+=("--dns-server")
    local_nonpersistent_flags+=("--dns-server")
    local_nonpersistent_flags+=("--dns-server=")
    flags+=("--namespace=")
    two_word_flags+=("--namespace")
    two_word_flags+=("-n")
    local_nonpersistent_flags+=("--namespace")
    local_nonpersistent_flags+=("--namespace=")
    local_nonpersistent_flags+=("-n")
    flags+=("--set=")
    two_word_flags+=("--set")
    local_nonpersistent_flags+=("--set")
    local_nonpersistent_flags+=("--set=")
    flags+=("--update-repo")
    local_nonpersistent_flags+=("--update-repo")
    flags+=("--version=")
    two_word_flags+=("--version")
    two_word_flags+=("-v")
    local_nonpersistent_flags+=("--version")
    local_nonpersistent_flags+=("--version=")
    local_nonpersistent_flags+=("-v")
    flags+=("--kubeconfig=")
    two_word_flags+=("--kubeconfig")
    flags+=("--wait")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_arkade_install_chart()
{
    last_command="arkade_install_chart"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--namespace=")
    two_word_flags+=("--namespace")
    two_word_flags+=("-n")
    local_nonpersistent_flags+=("--namespace")
    local_nonpersistent_flags+=("--namespace=")
    local_nonpersistent_flags+=("-n")
    flags+=("--repo=")
    two_word_flags+=("--repo")
    local_nonpersistent_flags+=("--repo")
    local_nonpersistent_flags+=("--repo=")
    flags+=("--repo-name=")
    two_word_flags+=("--repo-name")
    local_nonpersistent_flags+=("--repo-name")
    local_nonpersistent_flags+=("--repo-name=")
    flags+=("--repo-url=")
    two_word_flags+=("--repo-url")
    local_nonpersistent_flags+=("--repo-url")
    local_nonpersistent_flags+=("--repo-url=")
    flags+=("--set=")
    two_word_flags+=("--set")
    local_nonpersistent_flags+=("--set")
    local_nonpersistent_flags+=("--set=")
    flags+=("--values=")
    two_word_flags+=("--values")
    two_word_flags+=("-f")
    local_nonpersistent_flags+=("--values")
    local_nonpersistent_flags+=("--values=")
    local_nonpersistent_flags+=("-f")
    flags+=("--kubeconfig=")
    two_word_flags+=("--kubeconfig")
    flags+=("--wait")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_arkade_install_cockroachdb()
{
    last_command="arkade_install_cockroachdb"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--namespace=")
    two_word_flags+=("--namespace")
    local_nonpersistent_flags+=("--namespace")
    local_nonpersistent_flags+=("--namespace=")
    flags+=("--persistence")
    local_nonpersistent_flags+=("--persistence")
    flags+=("--replicas=")
    two_word_flags+=("--replicas")
    local_nonpersistent_flags+=("--replicas")
    local_nonpersistent_flags+=("--replicas=")
    flags+=("--set=")
    two_word_flags+=("--set")
    local_nonpersistent_flags+=("--set")
    local_nonpersistent_flags+=("--set=")
    flags+=("--single-node")
    local_nonpersistent_flags+=("--single-node")
    flags+=("--tls")
    local_nonpersistent_flags+=("--tls")
    flags+=("--update-repo")
    local_nonpersistent_flags+=("--update-repo")
    flags+=("--kubeconfig=")
    two_word_flags+=("--kubeconfig")
    flags+=("--wait")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_arkade_install_consul-connect()
{
    last_command="arkade_install_consul-connect"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--datacenter=")
    two_word_flags+=("--datacenter")
    two_word_flags+=("-d")
    local_nonpersistent_flags+=("--datacenter")
    local_nonpersistent_flags+=("--datacenter=")
    local_nonpersistent_flags+=("-d")
    flags+=("--enable-connect-injector")
    local_nonpersistent_flags+=("--enable-connect-injector")
    flags+=("--enable-gossip-encryption")
    local_nonpersistent_flags+=("--enable-gossip-encryption")
    flags+=("--enable-tls-encryption")
    local_nonpersistent_flags+=("--enable-tls-encryption")
    flags+=("--gossip-encryption-key=")
    two_word_flags+=("--gossip-encryption-key")
    local_nonpersistent_flags+=("--gossip-encryption-key")
    local_nonpersistent_flags+=("--gossip-encryption-key=")
    flags+=("--manage-system-acls")
    local_nonpersistent_flags+=("--manage-system-acls")
    flags+=("--namespace=")
    two_word_flags+=("--namespace")
    two_word_flags+=("-n")
    local_nonpersistent_flags+=("--namespace")
    local_nonpersistent_flags+=("--namespace=")
    local_nonpersistent_flags+=("-n")
    flags+=("--set=")
    two_word_flags+=("--set")
    local_nonpersistent_flags+=("--set")
    local_nonpersistent_flags+=("--set=")
    flags+=("--update-repo")
    local_nonpersistent_flags+=("--update-repo")
    flags+=("--kubeconfig=")
    two_word_flags+=("--kubeconfig")
    flags+=("--wait")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_arkade_install_cron-connector()
{
    last_command="arkade_install_cron-connector"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--namespace=")
    two_word_flags+=("--namespace")
    two_word_flags+=("-n")
    local_nonpersistent_flags+=("--namespace")
    local_nonpersistent_flags+=("--namespace=")
    local_nonpersistent_flags+=("-n")
    flags+=("--set=")
    two_word_flags+=("--set")
    local_nonpersistent_flags+=("--set")
    local_nonpersistent_flags+=("--set=")
    flags+=("--update-repo")
    local_nonpersistent_flags+=("--update-repo")
    flags+=("--kubeconfig=")
    two_word_flags+=("--kubeconfig")
    flags+=("--wait")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_arkade_install_crossplane()
{
    last_command="arkade_install_crossplane"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--namespace=")
    two_word_flags+=("--namespace")
    two_word_flags+=("-n")
    local_nonpersistent_flags+=("--namespace")
    local_nonpersistent_flags+=("--namespace=")
    local_nonpersistent_flags+=("-n")
    flags+=("--set=")
    two_word_flags+=("--set")
    local_nonpersistent_flags+=("--set")
    local_nonpersistent_flags+=("--set=")
    flags+=("--update-repo")
    local_nonpersistent_flags+=("--update-repo")
    flags+=("--kubeconfig=")
    two_word_flags+=("--kubeconfig")
    flags+=("--wait")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_arkade_install_docker-registry()
{
    last_command="arkade_install_docker-registry"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--namespace=")
    two_word_flags+=("--namespace")
    two_word_flags+=("-n")
    local_nonpersistent_flags+=("--namespace")
    local_nonpersistent_flags+=("--namespace=")
    local_nonpersistent_flags+=("-n")
    flags+=("--password=")
    two_word_flags+=("--password")
    two_word_flags+=("-p")
    local_nonpersistent_flags+=("--password")
    local_nonpersistent_flags+=("--password=")
    local_nonpersistent_flags+=("-p")
    flags+=("--persistence")
    local_nonpersistent_flags+=("--persistence")
    flags+=("--set=")
    two_word_flags+=("--set")
    local_nonpersistent_flags+=("--set")
    local_nonpersistent_flags+=("--set=")
    flags+=("--update-repo")
    local_nonpersistent_flags+=("--update-repo")
    flags+=("--username=")
    two_word_flags+=("--username")
    two_word_flags+=("-u")
    local_nonpersistent_flags+=("--username")
    local_nonpersistent_flags+=("--username=")
    local_nonpersistent_flags+=("-u")
    flags+=("--write-file=")
    two_word_flags+=("--write-file")
    two_word_flags+=("-w")
    local_nonpersistent_flags+=("--write-file")
    local_nonpersistent_flags+=("--write-file=")
    local_nonpersistent_flags+=("-w")
    flags+=("--kubeconfig=")
    two_word_flags+=("--kubeconfig")
    flags+=("--wait")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_arkade_install_docker-registry-ingress()
{
    last_command="arkade_install_docker-registry-ingress"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--domain=")
    two_word_flags+=("--domain")
    two_word_flags+=("-d")
    local_nonpersistent_flags+=("--domain")
    local_nonpersistent_flags+=("--domain=")
    local_nonpersistent_flags+=("-d")
    flags+=("--email=")
    two_word_flags+=("--email")
    two_word_flags+=("-e")
    local_nonpersistent_flags+=("--email")
    local_nonpersistent_flags+=("--email=")
    local_nonpersistent_flags+=("-e")
    flags+=("--ingress-class=")
    two_word_flags+=("--ingress-class")
    local_nonpersistent_flags+=("--ingress-class")
    local_nonpersistent_flags+=("--ingress-class=")
    flags+=("--max-size=")
    two_word_flags+=("--max-size")
    local_nonpersistent_flags+=("--max-size")
    local_nonpersistent_flags+=("--max-size=")
    flags+=("--namespace=")
    two_word_flags+=("--namespace")
    two_word_flags+=("-n")
    local_nonpersistent_flags+=("--namespace")
    local_nonpersistent_flags+=("--namespace=")
    local_nonpersistent_flags+=("-n")
    flags+=("--staging")
    local_nonpersistent_flags+=("--staging")
    flags+=("--kubeconfig=")
    two_word_flags+=("--kubeconfig")
    flags+=("--wait")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_arkade_install_falco()
{
    last_command="arkade_install_falco"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--set=")
    two_word_flags+=("--set")
    local_nonpersistent_flags+=("--set")
    local_nonpersistent_flags+=("--set=")
    flags+=("--sidekick")
    local_nonpersistent_flags+=("--sidekick")
    flags+=("--update-repo")
    local_nonpersistent_flags+=("--update-repo")
    flags+=("--webui")
    local_nonpersistent_flags+=("--webui")
    flags+=("--kubeconfig=")
    two_word_flags+=("--kubeconfig")
    flags+=("--wait")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_arkade_install_gitea()
{
    last_command="arkade_install_gitea"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--namespace=")
    two_word_flags+=("--namespace")
    local_nonpersistent_flags+=("--namespace")
    local_nonpersistent_flags+=("--namespace=")
    flags+=("--password=")
    two_word_flags+=("--password")
    two_word_flags+=("-p")
    local_nonpersistent_flags+=("--password")
    local_nonpersistent_flags+=("--password=")
    local_nonpersistent_flags+=("-p")
    flags+=("--persistence")
    local_nonpersistent_flags+=("--persistence")
    flags+=("--set=")
    two_word_flags+=("--set")
    local_nonpersistent_flags+=("--set")
    local_nonpersistent_flags+=("--set=")
    flags+=("--update-repo")
    local_nonpersistent_flags+=("--update-repo")
    flags+=("--user=")
    two_word_flags+=("--user")
    two_word_flags+=("-u")
    local_nonpersistent_flags+=("--user")
    local_nonpersistent_flags+=("--user=")
    local_nonpersistent_flags+=("-u")
    flags+=("--kubeconfig=")
    two_word_flags+=("--kubeconfig")
    flags+=("--wait")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_arkade_install_gitlab()
{
    last_command="arkade_install_gitlab"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--ce")
    local_nonpersistent_flags+=("--ce")
    flags+=("--domain=")
    two_word_flags+=("--domain")
    two_word_flags+=("-d")
    local_nonpersistent_flags+=("--domain")
    local_nonpersistent_flags+=("--domain=")
    local_nonpersistent_flags+=("-d")
    flags+=("--external-ip=")
    two_word_flags+=("--external-ip")
    two_word_flags+=("-i")
    local_nonpersistent_flags+=("--external-ip")
    local_nonpersistent_flags+=("--external-ip=")
    local_nonpersistent_flags+=("-i")
    flags+=("--namespace=")
    two_word_flags+=("--namespace")
    two_word_flags+=("-n")
    local_nonpersistent_flags+=("--namespace")
    local_nonpersistent_flags+=("--namespace=")
    local_nonpersistent_flags+=("-n")
    flags+=("--no-minio")
    local_nonpersistent_flags+=("--no-minio")
    flags+=("--no-pgsql")
    local_nonpersistent_flags+=("--no-pgsql")
    flags+=("--no-redis")
    local_nonpersistent_flags+=("--no-redis")
    flags+=("--set=")
    two_word_flags+=("--set")
    local_nonpersistent_flags+=("--set")
    local_nonpersistent_flags+=("--set=")
    flags+=("--update-repo")
    local_nonpersistent_flags+=("--update-repo")
    flags+=("--kubeconfig=")
    two_word_flags+=("--kubeconfig")
    flags+=("--wait")

    must_have_one_flag=()
    must_have_one_flag+=("--domain=")
    must_have_one_flag+=("-d")
    must_have_one_flag+=("--external-ip=")
    must_have_one_flag+=("-i")
    must_have_one_noun=()
    noun_aliases=()
}

_arkade_install_grafana()
{
    last_command="arkade_install_grafana"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--namespace=")
    two_word_flags+=("--namespace")
    two_word_flags+=("-n")
    local_nonpersistent_flags+=("--namespace")
    local_nonpersistent_flags+=("--namespace=")
    local_nonpersistent_flags+=("-n")
    flags+=("--persistence")
    local_nonpersistent_flags+=("--persistence")
    flags+=("--set=")
    two_word_flags+=("--set")
    local_nonpersistent_flags+=("--set")
    local_nonpersistent_flags+=("--set=")
    flags+=("--update-repo")
    local_nonpersistent_flags+=("--update-repo")
    flags+=("--kubeconfig=")
    two_word_flags+=("--kubeconfig")
    flags+=("--wait")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_arkade_install_influxdb()
{
    last_command="arkade_install_influxdb"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--namespace=")
    two_word_flags+=("--namespace")
    two_word_flags+=("-n")
    local_nonpersistent_flags+=("--namespace")
    local_nonpersistent_flags+=("--namespace=")
    local_nonpersistent_flags+=("-n")
    flags+=("--persistence")
    local_nonpersistent_flags+=("--persistence")
    flags+=("--update-repo")
    local_nonpersistent_flags+=("--update-repo")
    flags+=("--kubeconfig=")
    two_word_flags+=("--kubeconfig")
    flags+=("--wait")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_arkade_install_info()
{
    last_command="arkade_install_info"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--kubeconfig=")
    two_word_flags+=("--kubeconfig")
    flags+=("--wait")

    must_have_one_flag=()
    must_have_one_noun=()
    has_completion_function=1
    noun_aliases=()
}

_arkade_install_ingress-nginx()
{
    last_command="arkade_install_ingress-nginx"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--default-ingress")
    local_nonpersistent_flags+=("--default-ingress")
    flags+=("--host-mode")
    local_nonpersistent_flags+=("--host-mode")
    flags+=("--namespace=")
    two_word_flags+=("--namespace")
    two_word_flags+=("-n")
    local_nonpersistent_flags+=("--namespace")
    local_nonpersistent_flags+=("--namespace=")
    local_nonpersistent_flags+=("-n")
    flags+=("--set=")
    two_word_flags+=("--set")
    local_nonpersistent_flags+=("--set")
    local_nonpersistent_flags+=("--set=")
    flags+=("--update-repo")
    local_nonpersistent_flags+=("--update-repo")
    flags+=("--kubeconfig=")
    two_word_flags+=("--kubeconfig")
    flags+=("--wait")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_arkade_install_inlets-operator()
{
    last_command="arkade_install_inlets-operator"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--client-image=")
    two_word_flags+=("--client-image")
    local_nonpersistent_flags+=("--client-image")
    local_nonpersistent_flags+=("--client-image=")
    flags+=("--inlets-release=")
    two_word_flags+=("--inlets-release")
    local_nonpersistent_flags+=("--inlets-release")
    local_nonpersistent_flags+=("--inlets-release=")
    flags+=("--license=")
    two_word_flags+=("--license")
    two_word_flags+=("-l")
    local_nonpersistent_flags+=("--license")
    local_nonpersistent_flags+=("--license=")
    local_nonpersistent_flags+=("-l")
    flags+=("--license-file=")
    two_word_flags+=("--license-file")
    two_word_flags+=("-f")
    local_nonpersistent_flags+=("--license-file")
    local_nonpersistent_flags+=("--license-file=")
    local_nonpersistent_flags+=("-f")
    flags+=("--namespace=")
    two_word_flags+=("--namespace")
    two_word_flags+=("-n")
    local_nonpersistent_flags+=("--namespace")
    local_nonpersistent_flags+=("--namespace=")
    local_nonpersistent_flags+=("-n")
    flags+=("--organization-id=")
    two_word_flags+=("--organization-id")
    local_nonpersistent_flags+=("--organization-id")
    local_nonpersistent_flags+=("--organization-id=")
    flags+=("--project-id=")
    two_word_flags+=("--project-id")
    local_nonpersistent_flags+=("--project-id")
    local_nonpersistent_flags+=("--project-id=")
    flags+=("--provider=")
    two_word_flags+=("--provider")
    two_word_flags+=("-p")
    local_nonpersistent_flags+=("--provider")
    local_nonpersistent_flags+=("--provider=")
    local_nonpersistent_flags+=("-p")
    flags+=("--region=")
    two_word_flags+=("--region")
    two_word_flags+=("-r")
    local_nonpersistent_flags+=("--region")
    local_nonpersistent_flags+=("--region=")
    local_nonpersistent_flags+=("-r")
    flags+=("--secret-key-file=")
    two_word_flags+=("--secret-key-file")
    two_word_flags+=("-s")
    local_nonpersistent_flags+=("--secret-key-file")
    local_nonpersistent_flags+=("--secret-key-file=")
    local_nonpersistent_flags+=("-s")
    flags+=("--set=")
    two_word_flags+=("--set")
    local_nonpersistent_flags+=("--set")
    local_nonpersistent_flags+=("--set=")
    flags+=("--subscription-id=")
    two_word_flags+=("--subscription-id")
    local_nonpersistent_flags+=("--subscription-id")
    local_nonpersistent_flags+=("--subscription-id=")
    flags+=("--token=")
    two_word_flags+=("--token")
    two_word_flags+=("-k")
    local_nonpersistent_flags+=("--token")
    local_nonpersistent_flags+=("--token=")
    local_nonpersistent_flags+=("-k")
    flags+=("--token-file=")
    two_word_flags+=("--token-file")
    two_word_flags+=("-t")
    local_nonpersistent_flags+=("--token-file")
    local_nonpersistent_flags+=("--token-file=")
    local_nonpersistent_flags+=("-t")
    flags+=("--update-repo")
    local_nonpersistent_flags+=("--update-repo")
    flags+=("--zone=")
    two_word_flags+=("--zone")
    two_word_flags+=("-z")
    local_nonpersistent_flags+=("--zone")
    local_nonpersistent_flags+=("--zone=")
    local_nonpersistent_flags+=("-z")
    flags+=("--kubeconfig=")
    two_word_flags+=("--kubeconfig")
    flags+=("--wait")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_arkade_install_istio()
{
    last_command="arkade_install_istio"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--cpu=")
    two_word_flags+=("--cpu")
    local_nonpersistent_flags+=("--cpu")
    local_nonpersistent_flags+=("--cpu=")
    flags+=("--istio-namespace=")
    two_word_flags+=("--istio-namespace")
    local_nonpersistent_flags+=("--istio-namespace")
    local_nonpersistent_flags+=("--istio-namespace=")
    flags+=("--memory=")
    two_word_flags+=("--memory")
    local_nonpersistent_flags+=("--memory")
    local_nonpersistent_flags+=("--memory=")
    flags+=("--namespace=")
    two_word_flags+=("--namespace")
    local_nonpersistent_flags+=("--namespace")
    local_nonpersistent_flags+=("--namespace=")
    flags+=("--profile=")
    two_word_flags+=("--profile")
    local_nonpersistent_flags+=("--profile")
    local_nonpersistent_flags+=("--profile=")
    flags+=("--set=")
    two_word_flags+=("--set")
    local_nonpersistent_flags+=("--set")
    local_nonpersistent_flags+=("--set=")
    flags+=("--version=")
    two_word_flags+=("--version")
    two_word_flags+=("-v")
    local_nonpersistent_flags+=("--version")
    local_nonpersistent_flags+=("--version=")
    local_nonpersistent_flags+=("-v")
    flags+=("--kubeconfig=")
    two_word_flags+=("--kubeconfig")
    flags+=("--wait")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_arkade_install_jenkins()
{
    last_command="arkade_install_jenkins"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--namespace=")
    two_word_flags+=("--namespace")
    local_nonpersistent_flags+=("--namespace")
    local_nonpersistent_flags+=("--namespace=")
    flags+=("--persistence")
    local_nonpersistent_flags+=("--persistence")
    flags+=("--set=")
    two_word_flags+=("--set")
    local_nonpersistent_flags+=("--set")
    local_nonpersistent_flags+=("--set=")
    flags+=("--update-repo")
    local_nonpersistent_flags+=("--update-repo")
    flags+=("--kubeconfig=")
    two_word_flags+=("--kubeconfig")
    flags+=("--wait")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_arkade_install_kafka()
{
    last_command="arkade_install_kafka"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--control-center")
    local_nonpersistent_flags+=("--control-center")
    flags+=("--kafka")
    local_nonpersistent_flags+=("--kafka")
    flags+=("--kafka-broker-count=")
    two_word_flags+=("--kafka-broker-count")
    local_nonpersistent_flags+=("--kafka-broker-count")
    local_nonpersistent_flags+=("--kafka-broker-count=")
    flags+=("--kafka-connect")
    local_nonpersistent_flags+=("--kafka-connect")
    flags+=("--kafka-rest")
    local_nonpersistent_flags+=("--kafka-rest")
    flags+=("--ksql-server")
    local_nonpersistent_flags+=("--ksql-server")
    flags+=("--schema-registry")
    local_nonpersistent_flags+=("--schema-registry")
    flags+=("--update-repo")
    local_nonpersistent_flags+=("--update-repo")
    flags+=("--zookeeper")
    local_nonpersistent_flags+=("--zookeeper")
    flags+=("--zookeeper-server-count=")
    two_word_flags+=("--zookeeper-server-count")
    local_nonpersistent_flags+=("--zookeeper-server-count")
    local_nonpersistent_flags+=("--zookeeper-server-count=")
    flags+=("--kubeconfig=")
    two_word_flags+=("--kubeconfig")
    flags+=("--wait")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_arkade_install_kafka-connector()
{
    last_command="arkade_install_kafka-connector"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--broker-hosts=")
    two_word_flags+=("--broker-hosts")
    local_nonpersistent_flags+=("--broker-hosts")
    local_nonpersistent_flags+=("--broker-hosts=")
    flags+=("--image=")
    two_word_flags+=("--image")
    local_nonpersistent_flags+=("--image")
    local_nonpersistent_flags+=("--image=")
    flags+=("--license-file=")
    two_word_flags+=("--license-file")
    local_nonpersistent_flags+=("--license-file")
    local_nonpersistent_flags+=("--license-file=")
    flags+=("--namespace=")
    two_word_flags+=("--namespace")
    two_word_flags+=("-n")
    local_nonpersistent_flags+=("--namespace")
    local_nonpersistent_flags+=("--namespace=")
    local_nonpersistent_flags+=("-n")
    flags+=("--set=")
    two_word_flags+=("--set")
    local_nonpersistent_flags+=("--set")
    local_nonpersistent_flags+=("--set=")
    flags+=("--topics=")
    two_word_flags+=("--topics")
    two_word_flags+=("-t")
    local_nonpersistent_flags+=("--topics")
    local_nonpersistent_flags+=("--topics=")
    local_nonpersistent_flags+=("-t")
    flags+=("--update-repo")
    local_nonpersistent_flags+=("--update-repo")
    flags+=("--kubeconfig=")
    two_word_flags+=("--kubeconfig")
    flags+=("--wait")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_arkade_install_kong-ingress()
{
    last_command="arkade_install_kong-ingress"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--namespace=")
    two_word_flags+=("--namespace")
    two_word_flags+=("-n")
    local_nonpersistent_flags+=("--namespace")
    local_nonpersistent_flags+=("--namespace=")
    local_nonpersistent_flags+=("-n")
    flags+=("--set=")
    two_word_flags+=("--set")
    local_nonpersistent_flags+=("--set")
    local_nonpersistent_flags+=("--set=")
    flags+=("--update-repo")
    local_nonpersistent_flags+=("--update-repo")
    flags+=("--kubeconfig=")
    two_word_flags+=("--kubeconfig")
    flags+=("--wait")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_arkade_install_kube-image-prefetch()
{
    last_command="arkade_install_kube-image-prefetch"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--kubeconfig=")
    two_word_flags+=("--kubeconfig")
    flags+=("--wait")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_arkade_install_kube-state-metrics()
{
    last_command="arkade_install_kube-state-metrics"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--namespace=")
    two_word_flags+=("--namespace")
    two_word_flags+=("-n")
    local_nonpersistent_flags+=("--namespace")
    local_nonpersistent_flags+=("--namespace=")
    local_nonpersistent_flags+=("-n")
    flags+=("--set=")
    two_word_flags+=("--set")
    local_nonpersistent_flags+=("--set")
    local_nonpersistent_flags+=("--set=")
    flags+=("--update-repo")
    local_nonpersistent_flags+=("--update-repo")
    flags+=("--kubeconfig=")
    two_word_flags+=("--kubeconfig")
    flags+=("--wait")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_arkade_install_kubernetes-dashboard()
{
    last_command="arkade_install_kubernetes-dashboard"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--namespace=")
    two_word_flags+=("--namespace")
    two_word_flags+=("-n")
    local_nonpersistent_flags+=("--namespace")
    local_nonpersistent_flags+=("--namespace=")
    local_nonpersistent_flags+=("-n")
    flags+=("--set=")
    two_word_flags+=("--set")
    local_nonpersistent_flags+=("--set")
    local_nonpersistent_flags+=("--set=")
    flags+=("--update-repo")
    local_nonpersistent_flags+=("--update-repo")
    flags+=("--kubeconfig=")
    two_word_flags+=("--kubeconfig")
    flags+=("--wait")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_arkade_install_kuma()
{
    last_command="arkade_install_kuma"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--auto-scale")
    local_nonpersistent_flags+=("--auto-scale")
    flags+=("--control-plane-mode=")
    two_word_flags+=("--control-plane-mode")
    local_nonpersistent_flags+=("--control-plane-mode")
    local_nonpersistent_flags+=("--control-plane-mode=")
    flags+=("--ingress")
    local_nonpersistent_flags+=("--ingress")
    flags+=("--namespace=")
    two_word_flags+=("--namespace")
    local_nonpersistent_flags+=("--namespace")
    local_nonpersistent_flags+=("--namespace=")
    flags+=("--set=")
    two_word_flags+=("--set")
    local_nonpersistent_flags+=("--set")
    local_nonpersistent_flags+=("--set=")
    flags+=("--update-repo")
    local_nonpersistent_flags+=("--update-repo")
    flags+=("--use-cni")
    local_nonpersistent_flags+=("--use-cni")
    flags+=("--kubeconfig=")
    two_word_flags+=("--kubeconfig")
    flags+=("--wait")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_arkade_install_kyverno()
{
    last_command="arkade_install_kyverno"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--namespace=")
    two_word_flags+=("--namespace")
    two_word_flags+=("-n")
    local_nonpersistent_flags+=("--namespace")
    local_nonpersistent_flags+=("--namespace=")
    local_nonpersistent_flags+=("-n")
    flags+=("--set=")
    two_word_flags+=("--set")
    local_nonpersistent_flags+=("--set")
    local_nonpersistent_flags+=("--set=")
    flags+=("--update-repo")
    local_nonpersistent_flags+=("--update-repo")
    flags+=("--kubeconfig=")
    two_word_flags+=("--kubeconfig")
    flags+=("--wait")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_arkade_install_linkerd()
{
    last_command="arkade_install_linkerd"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--version=")
    two_word_flags+=("--version")
    two_word_flags+=("-v")
    local_nonpersistent_flags+=("--version")
    local_nonpersistent_flags+=("--version=")
    local_nonpersistent_flags+=("-v")
    flags+=("--kubeconfig=")
    two_word_flags+=("--kubeconfig")
    flags+=("--wait")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_arkade_install_loki()
{
    last_command="arkade_install_loki"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--grafana")
    local_nonpersistent_flags+=("--grafana")
    flags+=("--namespace=")
    two_word_flags+=("--namespace")
    two_word_flags+=("-n")
    local_nonpersistent_flags+=("--namespace")
    local_nonpersistent_flags+=("--namespace=")
    local_nonpersistent_flags+=("-n")
    flags+=("--persistence")
    local_nonpersistent_flags+=("--persistence")
    flags+=("--set=")
    two_word_flags+=("--set")
    local_nonpersistent_flags+=("--set")
    local_nonpersistent_flags+=("--set=")
    flags+=("--update-repo")
    local_nonpersistent_flags+=("--update-repo")
    flags+=("--kubeconfig=")
    two_word_flags+=("--kubeconfig")
    flags+=("--wait")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_arkade_install_metallb-arp()
{
    last_command="arkade_install_metallb-arp"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--address-range=")
    two_word_flags+=("--address-range")
    local_nonpersistent_flags+=("--address-range")
    local_nonpersistent_flags+=("--address-range=")
    flags+=("--memberlist-secretkey=")
    two_word_flags+=("--memberlist-secretkey")
    local_nonpersistent_flags+=("--memberlist-secretkey")
    local_nonpersistent_flags+=("--memberlist-secretkey=")
    flags+=("--kubeconfig=")
    two_word_flags+=("--kubeconfig")
    flags+=("--wait")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_arkade_install_metrics-server()
{
    last_command="arkade_install_metrics-server"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--namespace=")
    two_word_flags+=("--namespace")
    two_word_flags+=("-n")
    local_nonpersistent_flags+=("--namespace")
    local_nonpersistent_flags+=("--namespace=")
    local_nonpersistent_flags+=("-n")
    flags+=("--set=")
    two_word_flags+=("--set")
    local_nonpersistent_flags+=("--set")
    local_nonpersistent_flags+=("--set=")
    flags+=("--tag=")
    two_word_flags+=("--tag")
    two_word_flags+=("-t")
    local_nonpersistent_flags+=("--tag")
    local_nonpersistent_flags+=("--tag=")
    local_nonpersistent_flags+=("-t")
    flags+=("--update-repo")
    local_nonpersistent_flags+=("--update-repo")
    flags+=("--kubeconfig=")
    two_word_flags+=("--kubeconfig")
    flags+=("--wait")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_arkade_install_minio()
{
    last_command="arkade_install_minio"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--distributed")
    local_nonpersistent_flags+=("--distributed")
    flags+=("--namespace=")
    two_word_flags+=("--namespace")
    local_nonpersistent_flags+=("--namespace")
    local_nonpersistent_flags+=("--namespace=")
    flags+=("--persistence")
    local_nonpersistent_flags+=("--persistence")
    flags+=("--root-password=")
    two_word_flags+=("--root-password")
    local_nonpersistent_flags+=("--root-password")
    local_nonpersistent_flags+=("--root-password=")
    flags+=("--root-user=")
    two_word_flags+=("--root-user")
    local_nonpersistent_flags+=("--root-user")
    local_nonpersistent_flags+=("--root-user=")
    flags+=("--set=")
    two_word_flags+=("--set")
    local_nonpersistent_flags+=("--set")
    local_nonpersistent_flags+=("--set=")
    flags+=("--update-repo")
    local_nonpersistent_flags+=("--update-repo")
    flags+=("--kubeconfig=")
    two_word_flags+=("--kubeconfig")
    flags+=("--wait")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_arkade_install_mongodb()
{
    last_command="arkade_install_mongodb"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--namespace=")
    two_word_flags+=("--namespace")
    local_nonpersistent_flags+=("--namespace")
    local_nonpersistent_flags+=("--namespace=")
    flags+=("--persistence")
    local_nonpersistent_flags+=("--persistence")
    flags+=("--set=")
    two_word_flags+=("--set")
    local_nonpersistent_flags+=("--set")
    local_nonpersistent_flags+=("--set=")
    flags+=("--kubeconfig=")
    two_word_flags+=("--kubeconfig")
    flags+=("--wait")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_arkade_install_mqtt-connector()
{
    last_command="arkade_install_mqtt-connector"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--async")
    local_nonpersistent_flags+=("--async")
    flags+=("--broker-host=")
    two_word_flags+=("--broker-host")
    local_nonpersistent_flags+=("--broker-host")
    local_nonpersistent_flags+=("--broker-host=")
    flags+=("--client-id=")
    two_word_flags+=("--client-id")
    local_nonpersistent_flags+=("--client-id")
    local_nonpersistent_flags+=("--client-id=")
    flags+=("--namespace=")
    two_word_flags+=("--namespace")
    two_word_flags+=("-n")
    local_nonpersistent_flags+=("--namespace")
    local_nonpersistent_flags+=("--namespace=")
    local_nonpersistent_flags+=("-n")
    flags+=("--set=")
    two_word_flags+=("--set")
    local_nonpersistent_flags+=("--set")
    local_nonpersistent_flags+=("--set=")
    flags+=("--topics=")
    two_word_flags+=("--topics")
    two_word_flags+=("-t")
    local_nonpersistent_flags+=("--topics")
    local_nonpersistent_flags+=("--topics=")
    local_nonpersistent_flags+=("-t")
    flags+=("--update-repo")
    local_nonpersistent_flags+=("--update-repo")
    flags+=("--kubeconfig=")
    two_word_flags+=("--kubeconfig")
    flags+=("--wait")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_arkade_install_nats-connector()
{
    last_command="arkade_install_nats-connector"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--namespace=")
    two_word_flags+=("--namespace")
    two_word_flags+=("-n")
    local_nonpersistent_flags+=("--namespace")
    local_nonpersistent_flags+=("--namespace=")
    local_nonpersistent_flags+=("-n")
    flags+=("--set=")
    two_word_flags+=("--set")
    local_nonpersistent_flags+=("--set")
    local_nonpersistent_flags+=("--set=")
    flags+=("--update-repo")
    local_nonpersistent_flags+=("--update-repo")
    flags+=("--kubeconfig=")
    two_word_flags+=("--kubeconfig")
    flags+=("--wait")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_arkade_install_nfs-subdir-external-provisioner()
{
    last_command="arkade_install_nfs-subdir-external-provisioner"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--namespace=")
    two_word_flags+=("--namespace")
    two_word_flags+=("-n")
    local_nonpersistent_flags+=("--namespace")
    local_nonpersistent_flags+=("--namespace=")
    local_nonpersistent_flags+=("-n")
    flags+=("--nfs-path=")
    two_word_flags+=("--nfs-path")
    local_nonpersistent_flags+=("--nfs-path")
    local_nonpersistent_flags+=("--nfs-path=")
    flags+=("--nfs-server=")
    two_word_flags+=("--nfs-server")
    local_nonpersistent_flags+=("--nfs-server")
    local_nonpersistent_flags+=("--nfs-server=")
    flags+=("--set=")
    two_word_flags+=("--set")
    local_nonpersistent_flags+=("--set")
    local_nonpersistent_flags+=("--set=")
    flags+=("--update-repo")
    local_nonpersistent_flags+=("--update-repo")
    flags+=("--kubeconfig=")
    two_word_flags+=("--kubeconfig")
    flags+=("--wait")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_arkade_install_opa-gatekeeper()
{
    last_command="arkade_install_opa-gatekeeper"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--set=")
    two_word_flags+=("--set")
    local_nonpersistent_flags+=("--set")
    local_nonpersistent_flags+=("--set=")
    flags+=("--update-repo")
    local_nonpersistent_flags+=("--update-repo")
    flags+=("--kubeconfig=")
    two_word_flags+=("--kubeconfig")
    flags+=("--wait")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_arkade_install_openfaas()
{
    last_command="arkade_install_openfaas"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--autoscaler")
    local_nonpersistent_flags+=("--autoscaler")
    flags+=("--basic-auth")
    flags+=("-a")
    local_nonpersistent_flags+=("--basic-auth")
    local_nonpersistent_flags+=("-a")
    flags+=("--basic-auth-password=")
    two_word_flags+=("--basic-auth-password")
    local_nonpersistent_flags+=("--basic-auth-password")
    local_nonpersistent_flags+=("--basic-auth-password=")
    flags+=("--clusterrole")
    local_nonpersistent_flags+=("--clusterrole")
    flags+=("--dashboard")
    local_nonpersistent_flags+=("--dashboard")
    flags+=("--direct-functions")
    local_nonpersistent_flags+=("--direct-functions")
    flags+=("--function-pull-policy=")
    two_word_flags+=("--function-pull-policy")
    local_nonpersistent_flags+=("--function-pull-policy")
    local_nonpersistent_flags+=("--function-pull-policy=")
    flags+=("--gateways=")
    two_word_flags+=("--gateways")
    local_nonpersistent_flags+=("--gateways")
    local_nonpersistent_flags+=("--gateways=")
    flags+=("--ingress-operator")
    local_nonpersistent_flags+=("--ingress-operator")
    flags+=("--license-file=")
    two_word_flags+=("--license-file")
    local_nonpersistent_flags+=("--license-file")
    local_nonpersistent_flags+=("--license-file=")
    flags+=("--load-balancer")
    flags+=("-l")
    local_nonpersistent_flags+=("--load-balancer")
    local_nonpersistent_flags+=("-l")
    flags+=("--log-provider-url=")
    two_word_flags+=("--log-provider-url")
    local_nonpersistent_flags+=("--log-provider-url")
    local_nonpersistent_flags+=("--log-provider-url=")
    flags+=("--max-inflight=")
    two_word_flags+=("--max-inflight")
    local_nonpersistent_flags+=("--max-inflight")
    local_nonpersistent_flags+=("--max-inflight=")
    flags+=("--namespace=")
    two_word_flags+=("--namespace")
    two_word_flags+=("-n")
    local_nonpersistent_flags+=("--namespace")
    local_nonpersistent_flags+=("--namespace=")
    local_nonpersistent_flags+=("-n")
    flags+=("--operator")
    local_nonpersistent_flags+=("--operator")
    flags+=("--pull-policy=")
    two_word_flags+=("--pull-policy")
    local_nonpersistent_flags+=("--pull-policy")
    local_nonpersistent_flags+=("--pull-policy=")
    flags+=("--queue-mode=")
    two_word_flags+=("--queue-mode")
    local_nonpersistent_flags+=("--queue-mode")
    local_nonpersistent_flags+=("--queue-mode=")
    flags+=("--queue-workers=")
    two_word_flags+=("--queue-workers")
    local_nonpersistent_flags+=("--queue-workers")
    local_nonpersistent_flags+=("--queue-workers=")
    flags+=("--set=")
    two_word_flags+=("--set")
    local_nonpersistent_flags+=("--set")
    local_nonpersistent_flags+=("--set=")
    flags+=("--update-repo")
    local_nonpersistent_flags+=("--update-repo")
    flags+=("--values=")
    two_word_flags+=("--values")
    two_word_flags+=("-f")
    local_nonpersistent_flags+=("--values")
    local_nonpersistent_flags+=("--values=")
    local_nonpersistent_flags+=("-f")
    flags+=("--kubeconfig=")
    two_word_flags+=("--kubeconfig")
    flags+=("--wait")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_arkade_install_openfaas-ce()
{
    last_command="arkade_install_openfaas-ce"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--basic-auth")
    flags+=("-a")
    local_nonpersistent_flags+=("--basic-auth")
    local_nonpersistent_flags+=("-a")
    flags+=("--basic-auth-password=")
    two_word_flags+=("--basic-auth-password")
    local_nonpersistent_flags+=("--basic-auth-password")
    local_nonpersistent_flags+=("--basic-auth-password=")
    flags+=("--gateways=")
    two_word_flags+=("--gateways")
    local_nonpersistent_flags+=("--gateways")
    local_nonpersistent_flags+=("--gateways=")
    flags+=("--ingress-operator")
    local_nonpersistent_flags+=("--ingress-operator")
    flags+=("--load-balancer")
    flags+=("-l")
    local_nonpersistent_flags+=("--load-balancer")
    local_nonpersistent_flags+=("-l")
    flags+=("--max-inflight=")
    two_word_flags+=("--max-inflight")
    local_nonpersistent_flags+=("--max-inflight")
    local_nonpersistent_flags+=("--max-inflight=")
    flags+=("--namespace=")
    two_word_flags+=("--namespace")
    two_word_flags+=("-n")
    local_nonpersistent_flags+=("--namespace")
    local_nonpersistent_flags+=("--namespace=")
    local_nonpersistent_flags+=("-n")
    flags+=("--queue-workers=")
    two_word_flags+=("--queue-workers")
    local_nonpersistent_flags+=("--queue-workers")
    local_nonpersistent_flags+=("--queue-workers=")
    flags+=("--set=")
    two_word_flags+=("--set")
    local_nonpersistent_flags+=("--set")
    local_nonpersistent_flags+=("--set=")
    flags+=("--update-repo")
    local_nonpersistent_flags+=("--update-repo")
    flags+=("--kubeconfig=")
    two_word_flags+=("--kubeconfig")
    flags+=("--wait")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_arkade_install_openfaas-ingress()
{
    last_command="arkade_install_openfaas-ingress"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--cluster-issuer")
    local_nonpersistent_flags+=("--cluster-issuer")
    flags+=("--domain=")
    two_word_flags+=("--domain")
    two_word_flags+=("-d")
    local_nonpersistent_flags+=("--domain")
    local_nonpersistent_flags+=("--domain=")
    local_nonpersistent_flags+=("-d")
    flags+=("--email=")
    two_word_flags+=("--email")
    two_word_flags+=("-e")
    local_nonpersistent_flags+=("--email")
    local_nonpersistent_flags+=("--email=")
    local_nonpersistent_flags+=("-e")
    flags+=("--ingress-class=")
    two_word_flags+=("--ingress-class")
    local_nonpersistent_flags+=("--ingress-class")
    local_nonpersistent_flags+=("--ingress-class=")
    flags+=("--issuer=")
    two_word_flags+=("--issuer")
    local_nonpersistent_flags+=("--issuer")
    local_nonpersistent_flags+=("--issuer=")
    flags+=("--namespace=")
    two_word_flags+=("--namespace")
    two_word_flags+=("-n")
    local_nonpersistent_flags+=("--namespace")
    local_nonpersistent_flags+=("--namespace=")
    local_nonpersistent_flags+=("-n")
    flags+=("--oidc-plugin-domain=")
    two_word_flags+=("--oidc-plugin-domain")
    local_nonpersistent_flags+=("--oidc-plugin-domain")
    local_nonpersistent_flags+=("--oidc-plugin-domain=")
    flags+=("--staging")
    local_nonpersistent_flags+=("--staging")
    flags+=("--kubeconfig=")
    two_word_flags+=("--kubeconfig")
    flags+=("--wait")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_arkade_install_openfaas-loki()
{
    last_command="arkade_install_openfaas-loki"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--loki-url=")
    two_word_flags+=("--loki-url")
    local_nonpersistent_flags+=("--loki-url")
    local_nonpersistent_flags+=("--loki-url=")
    flags+=("--namespace=")
    two_word_flags+=("--namespace")
    two_word_flags+=("-n")
    local_nonpersistent_flags+=("--namespace")
    local_nonpersistent_flags+=("--namespace=")
    local_nonpersistent_flags+=("-n")
    flags+=("--openfaas-namespace=")
    two_word_flags+=("--openfaas-namespace")
    local_nonpersistent_flags+=("--openfaas-namespace")
    local_nonpersistent_flags+=("--openfaas-namespace=")
    flags+=("--set=")
    two_word_flags+=("--set")
    local_nonpersistent_flags+=("--set")
    local_nonpersistent_flags+=("--set=")
    flags+=("--version=")
    two_word_flags+=("--version")
    local_nonpersistent_flags+=("--version")
    local_nonpersistent_flags+=("--version=")
    flags+=("--kubeconfig=")
    two_word_flags+=("--kubeconfig")
    flags+=("--wait")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_arkade_install_portainer()
{
    last_command="arkade_install_portainer"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--namespace=")
    two_word_flags+=("--namespace")
    local_nonpersistent_flags+=("--namespace")
    local_nonpersistent_flags+=("--namespace=")
    flags+=("--persistence")
    local_nonpersistent_flags+=("--persistence")
    flags+=("--service-type=")
    two_word_flags+=("--service-type")
    local_nonpersistent_flags+=("--service-type")
    local_nonpersistent_flags+=("--service-type=")
    flags+=("--set=")
    two_word_flags+=("--set")
    local_nonpersistent_flags+=("--set")
    local_nonpersistent_flags+=("--set=")
    flags+=("--update-repo")
    local_nonpersistent_flags+=("--update-repo")
    flags+=("--kubeconfig=")
    two_word_flags+=("--kubeconfig")
    flags+=("--wait")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_arkade_install_postgresql()
{
    last_command="arkade_install_postgresql"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--namespace=")
    two_word_flags+=("--namespace")
    local_nonpersistent_flags+=("--namespace")
    local_nonpersistent_flags+=("--namespace=")
    flags+=("--persistence")
    local_nonpersistent_flags+=("--persistence")
    flags+=("--set=")
    two_word_flags+=("--set")
    local_nonpersistent_flags+=("--set")
    local_nonpersistent_flags+=("--set=")
    flags+=("--update-repo")
    local_nonpersistent_flags+=("--update-repo")
    flags+=("--kubeconfig=")
    two_word_flags+=("--kubeconfig")
    flags+=("--wait")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_arkade_install_prometheus()
{
    last_command="arkade_install_prometheus"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--alertmanager")
    local_nonpersistent_flags+=("--alertmanager")
    flags+=("--kube-state-metrics")
    local_nonpersistent_flags+=("--kube-state-metrics")
    flags+=("--namespace=")
    two_word_flags+=("--namespace")
    two_word_flags+=("-n")
    local_nonpersistent_flags+=("--namespace")
    local_nonpersistent_flags+=("--namespace=")
    local_nonpersistent_flags+=("-n")
    flags+=("--node-exporter")
    local_nonpersistent_flags+=("--node-exporter")
    flags+=("--prometheus")
    local_nonpersistent_flags+=("--prometheus")
    flags+=("--pushgateway")
    local_nonpersistent_flags+=("--pushgateway")
    flags+=("--set=")
    two_word_flags+=("--set")
    local_nonpersistent_flags+=("--set")
    local_nonpersistent_flags+=("--set=")
    flags+=("--update-repo")
    local_nonpersistent_flags+=("--update-repo")
    flags+=("--kubeconfig=")
    two_word_flags+=("--kubeconfig")
    flags+=("--wait")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_arkade_install_qemu-static()
{
    last_command="arkade_install_qemu-static"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--kubeconfig=")
    two_word_flags+=("--kubeconfig")
    flags+=("--wait")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_arkade_install_rabbitmq()
{
    last_command="arkade_install_rabbitmq"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--namespace=")
    two_word_flags+=("--namespace")
    two_word_flags+=("-n")
    local_nonpersistent_flags+=("--namespace")
    local_nonpersistent_flags+=("--namespace=")
    local_nonpersistent_flags+=("-n")
    flags+=("--persistence")
    local_nonpersistent_flags+=("--persistence")
    flags+=("--set=")
    two_word_flags+=("--set")
    local_nonpersistent_flags+=("--set")
    local_nonpersistent_flags+=("--set=")
    flags+=("--update-repo")
    local_nonpersistent_flags+=("--update-repo")
    flags+=("--kubeconfig=")
    two_word_flags+=("--kubeconfig")
    flags+=("--wait")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_arkade_install_redis()
{
    last_command="arkade_install_redis"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--namespace=")
    two_word_flags+=("--namespace")
    two_word_flags+=("-n")
    local_nonpersistent_flags+=("--namespace")
    local_nonpersistent_flags+=("--namespace=")
    local_nonpersistent_flags+=("-n")
    flags+=("--set=")
    two_word_flags+=("--set")
    local_nonpersistent_flags+=("--set")
    local_nonpersistent_flags+=("--set=")
    flags+=("--update-repo")
    local_nonpersistent_flags+=("--update-repo")
    flags+=("--kubeconfig=")
    two_word_flags+=("--kubeconfig")
    flags+=("--wait")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_arkade_install_registry-creds()
{
    last_command="arkade_install_registry-creds"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--email=")
    two_word_flags+=("--email")
    local_nonpersistent_flags+=("--email")
    local_nonpersistent_flags+=("--email=")
    flags+=("--from-env")
    local_nonpersistent_flags+=("--from-env")
    flags+=("--password=")
    two_word_flags+=("--password")
    local_nonpersistent_flags+=("--password")
    local_nonpersistent_flags+=("--password=")
    flags+=("--server=")
    two_word_flags+=("--server")
    local_nonpersistent_flags+=("--server")
    local_nonpersistent_flags+=("--server=")
    flags+=("--username=")
    two_word_flags+=("--username")
    local_nonpersistent_flags+=("--username")
    local_nonpersistent_flags+=("--username=")
    flags+=("--kubeconfig=")
    two_word_flags+=("--kubeconfig")
    flags+=("--wait")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_arkade_install_sealed-secrets()
{
    last_command="arkade_install_sealed-secrets"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--namespace=")
    two_word_flags+=("--namespace")
    local_nonpersistent_flags+=("--namespace")
    local_nonpersistent_flags+=("--namespace=")
    flags+=("--set=")
    two_word_flags+=("--set")
    local_nonpersistent_flags+=("--set")
    local_nonpersistent_flags+=("--set=")
    flags+=("--kubeconfig=")
    two_word_flags+=("--kubeconfig")
    flags+=("--wait")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_arkade_install_tekton()
{
    last_command="arkade_install_tekton"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--kubeconfig=")
    two_word_flags+=("--kubeconfig")
    flags+=("--wait")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_arkade_install_traefik2()
{
    last_command="arkade_install_traefik2"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--dashboard")
    local_nonpersistent_flags+=("--dashboard")
    flags+=("--ingress-provider")
    local_nonpersistent_flags+=("--ingress-provider")
    flags+=("--load-balancer")
    local_nonpersistent_flags+=("--load-balancer")
    flags+=("--namespace=")
    two_word_flags+=("--namespace")
    two_word_flags+=("-n")
    local_nonpersistent_flags+=("--namespace")
    local_nonpersistent_flags+=("--namespace=")
    local_nonpersistent_flags+=("-n")
    flags+=("--set=")
    two_word_flags+=("--set")
    local_nonpersistent_flags+=("--set")
    local_nonpersistent_flags+=("--set=")
    flags+=("--update-repo")
    local_nonpersistent_flags+=("--update-repo")
    flags+=("--wait")
    local_nonpersistent_flags+=("--wait")
    flags+=("--kubeconfig=")
    two_word_flags+=("--kubeconfig")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_arkade_install_vault()
{
    last_command="arkade_install_vault"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--domain=")
    two_word_flags+=("--domain")
    local_nonpersistent_flags+=("--domain")
    local_nonpersistent_flags+=("--domain=")
    flags+=("--ingress")
    local_nonpersistent_flags+=("--ingress")
    flags+=("--injector")
    local_nonpersistent_flags+=("--injector")
    flags+=("--namespace=")
    two_word_flags+=("--namespace")
    two_word_flags+=("-n")
    local_nonpersistent_flags+=("--namespace")
    local_nonpersistent_flags+=("--namespace=")
    local_nonpersistent_flags+=("-n")
    flags+=("--persistence")
    local_nonpersistent_flags+=("--persistence")
    flags+=("--set=")
    two_word_flags+=("--set")
    local_nonpersistent_flags+=("--set")
    local_nonpersistent_flags+=("--set=")
    flags+=("--update-repo")
    local_nonpersistent_flags+=("--update-repo")
    flags+=("--kubeconfig=")
    two_word_flags+=("--kubeconfig")
    flags+=("--wait")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_arkade_install_waypoint()
{
    last_command="arkade_install_waypoint"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--namespace=")
    two_word_flags+=("--namespace")
    two_word_flags+=("-n")
    local_nonpersistent_flags+=("--namespace")
    local_nonpersistent_flags+=("--namespace=")
    local_nonpersistent_flags+=("-n")
    flags+=("--set=")
    two_word_flags+=("--set")
    local_nonpersistent_flags+=("--set")
    local_nonpersistent_flags+=("--set=")
    flags+=("--update-repo")
    local_nonpersistent_flags+=("--update-repo")
    flags+=("--kubeconfig=")
    two_word_flags+=("--kubeconfig")
    flags+=("--wait")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_arkade_install()
{
    last_command="arkade_install"

    command_aliases=()

    commands=()
    commands+=("argocd")
    commands+=("cassandra")
    commands+=("cert-manager")
    commands+=("chart")
    commands+=("cockroachdb")
    commands+=("consul-connect")
    commands+=("cron-connector")
    commands+=("crossplane")
    commands+=("docker-registry")
    commands+=("docker-registry-ingress")
    commands+=("falco")
    commands+=("gitea")
    commands+=("gitlab")
    commands+=("grafana")
    commands+=("influxdb")
    commands+=("info")
    if [[ -z "${BASH_VERSION:-}" || "${BASH_VERSINFO[0]:-}" -gt 3 ]]; then
        command_aliases+=("f")
        aliashash["f"]="info"
    fi
    commands+=("ingress-nginx")
    if [[ -z "${BASH_VERSION:-}" || "${BASH_VERSINFO[0]:-}" -gt 3 ]]; then
        command_aliases+=("nginx-ingress")
        aliashash["nginx-ingress"]="ingress-nginx"
    fi
    commands+=("inlets-operator")
    commands+=("istio")
    commands+=("jenkins")
    commands+=("kafka")
    commands+=("kafka-connector")
    commands+=("kong-ingress")
    commands+=("kube-image-prefetch")
    commands+=("kube-state-metrics")
    commands+=("kubernetes-dashboard")
    commands+=("kuma")
    commands+=("kyverno")
    commands+=("linkerd")
    commands+=("loki")
    commands+=("metallb-arp")
    commands+=("metrics-server")
    commands+=("minio")
    commands+=("mongodb")
    commands+=("mqtt-connector")
    commands+=("nats-connector")
    commands+=("nfs-subdir-external-provisioner")
    if [[ -z "${BASH_VERSION:-}" || "${BASH_VERSINFO[0]:-}" -gt 3 ]]; then
        command_aliases+=("nfs-client-provisioner")
        aliashash["nfs-client-provisioner"]="nfs-subdir-external-provisioner"
        command_aliases+=("nfs-provisioner")
        aliashash["nfs-provisioner"]="nfs-subdir-external-provisioner"
    fi
    commands+=("opa-gatekeeper")
    if [[ -z "${BASH_VERSION:-}" || "${BASH_VERSINFO[0]:-}" -gt 3 ]]; then
        command_aliases+=("gatekeeper")
        aliashash["gatekeeper"]="opa-gatekeeper"
    fi
    commands+=("openfaas")
    commands+=("openfaas-ce")
    commands+=("openfaas-ingress")
    commands+=("openfaas-loki")
    commands+=("portainer")
    commands+=("postgresql")
    commands+=("prometheus")
    commands+=("qemu-static")
    if [[ -z "${BASH_VERSION:-}" || "${BASH_VERSINFO[0]:-}" -gt 3 ]]; then
        command_aliases+=("binfmt")
        aliashash["binfmt"]="qemu-static"
        command_aliases+=("qemu-user-static")
        aliashash["qemu-user-static"]="qemu-static"
    fi
    commands+=("rabbitmq")
    commands+=("redis")
    commands+=("registry-creds")
    commands+=("sealed-secrets")
    commands+=("tekton")
    commands+=("traefik2")
    commands+=("vault")
    commands+=("waypoint")

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--kubeconfig=")
    two_word_flags+=("--kubeconfig")
    flags+=("--print-table")
    local_nonpersistent_flags+=("--print-table")
    flags+=("--wait")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_arkade_oci_install()
{
    last_command="arkade_oci_install"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--arch=")
    two_word_flags+=("--arch")
    local_nonpersistent_flags+=("--arch")
    local_nonpersistent_flags+=("--arch=")
    flags+=("--flat")
    local_nonpersistent_flags+=("--flat")
    flags+=("--gzipped")
    flags+=("-g")
    local_nonpersistent_flags+=("--gzipped")
    local_nonpersistent_flags+=("-g")
    flags+=("--os=")
    two_word_flags+=("--os")
    local_nonpersistent_flags+=("--os")
    local_nonpersistent_flags+=("--os=")
    flags+=("--progress")
    local_nonpersistent_flags+=("--progress")
    flags+=("--quiet")
    local_nonpersistent_flags+=("--quiet")
    flags+=("--symlink")
    local_nonpersistent_flags+=("--symlink")
    flags+=("--version=")
    two_word_flags+=("--version")
    two_word_flags+=("-v")
    local_nonpersistent_flags+=("--version")
    local_nonpersistent_flags+=("--version=")
    local_nonpersistent_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_arkade_oci()
{
    last_command="arkade_oci"

    command_aliases=()

    commands=()
    commands+=("install")
    if [[ -z "${BASH_VERSION:-}" || "${BASH_VERSINFO[0]:-}" -gt 3 ]]; then
        command_aliases+=("extract")
        aliashash["extract"]="install"
        command_aliases+=("i")
        aliashash["i"]="install"
    fi

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()


    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_arkade_search()
{
    last_command="arkade_search"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--format=")
    two_word_flags+=("--format")
    local_nonpersistent_flags+=("--format")
    local_nonpersistent_flags+=("--format=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_arkade_system_install_actions-runner()
{
    last_command="arkade_system_install_actions-runner"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--arch=")
    two_word_flags+=("--arch")
    local_nonpersistent_flags+=("--arch")
    local_nonpersistent_flags+=("--arch=")
    flags+=("--path=")
    two_word_flags+=("--path")
    local_nonpersistent_flags+=("--path")
    local_nonpersistent_flags+=("--path=")
    flags+=("--progress")
    local_nonpersistent_flags+=("--progress")
    flags+=("--version=")
    two_word_flags+=("--version")
    two_word_flags+=("-v")
    local_nonpersistent_flags+=("--version")
    local_nonpersistent_flags+=("--version=")
    local_nonpersistent_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_arkade_system_install_buildkitd()
{
    last_command="arkade_system_install_buildkitd"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--arch=")
    two_word_flags+=("--arch")
    local_nonpersistent_flags+=("--arch")
    local_nonpersistent_flags+=("--arch=")
    flags+=("--path=")
    two_word_flags+=("--path")
    local_nonpersistent_flags+=("--path")
    local_nonpersistent_flags+=("--path=")
    flags+=("--progress")
    local_nonpersistent_flags+=("--progress")
    flags+=("--version=")
    two_word_flags+=("--version")
    two_word_flags+=("-v")
    local_nonpersistent_flags+=("--version")
    local_nonpersistent_flags+=("--version=")
    local_nonpersistent_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_arkade_system_install_caddy()
{
    last_command="arkade_system_install_caddy"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--arch=")
    two_word_flags+=("--arch")
    local_nonpersistent_flags+=("--arch")
    local_nonpersistent_flags+=("--arch=")
    flags+=("--path=")
    two_word_flags+=("--path")
    local_nonpersistent_flags+=("--path")
    local_nonpersistent_flags+=("--path=")
    flags+=("--progress")
    local_nonpersistent_flags+=("--progress")
    flags+=("--version=")
    two_word_flags+=("--version")
    two_word_flags+=("-v")
    local_nonpersistent_flags+=("--version")
    local_nonpersistent_flags+=("--version=")
    local_nonpersistent_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_arkade_system_install_cni()
{
    last_command="arkade_system_install_cni"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--arch=")
    two_word_flags+=("--arch")
    local_nonpersistent_flags+=("--arch")
    local_nonpersistent_flags+=("--arch=")
    flags+=("--path=")
    two_word_flags+=("--path")
    two_word_flags+=("-p")
    local_nonpersistent_flags+=("--path")
    local_nonpersistent_flags+=("--path=")
    local_nonpersistent_flags+=("-p")
    flags+=("--progress")
    local_nonpersistent_flags+=("--progress")
    flags+=("--version=")
    two_word_flags+=("--version")
    two_word_flags+=("-v")
    local_nonpersistent_flags+=("--version")
    local_nonpersistent_flags+=("--version=")
    local_nonpersistent_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_arkade_system_install_containerd()
{
    last_command="arkade_system_install_containerd"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--arch=")
    two_word_flags+=("--arch")
    local_nonpersistent_flags+=("--arch")
    local_nonpersistent_flags+=("--arch=")
    flags+=("--path=")
    two_word_flags+=("--path")
    local_nonpersistent_flags+=("--path")
    local_nonpersistent_flags+=("--path=")
    flags+=("--progress")
    local_nonpersistent_flags+=("--progress")
    flags+=("--systemd")
    local_nonpersistent_flags+=("--systemd")
    flags+=("--version=")
    two_word_flags+=("--version")
    two_word_flags+=("-v")
    local_nonpersistent_flags+=("--version")
    local_nonpersistent_flags+=("--version=")
    local_nonpersistent_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_arkade_system_install_firecracker()
{
    last_command="arkade_system_install_firecracker"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--path=")
    two_word_flags+=("--path")
    two_word_flags+=("-p")
    local_nonpersistent_flags+=("--path")
    local_nonpersistent_flags+=("--path=")
    local_nonpersistent_flags+=("-p")
    flags+=("--progress")
    local_nonpersistent_flags+=("--progress")
    flags+=("--version=")
    two_word_flags+=("--version")
    two_word_flags+=("-v")
    local_nonpersistent_flags+=("--version")
    local_nonpersistent_flags+=("--version=")
    local_nonpersistent_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_arkade_system_install_gitlab-runner()
{
    last_command="arkade_system_install_gitlab-runner"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--arch=")
    two_word_flags+=("--arch")
    local_nonpersistent_flags+=("--arch")
    local_nonpersistent_flags+=("--arch=")
    flags+=("--path=")
    two_word_flags+=("--path")
    local_nonpersistent_flags+=("--path")
    local_nonpersistent_flags+=("--path=")
    flags+=("--progress")
    local_nonpersistent_flags+=("--progress")
    flags+=("--version=")
    two_word_flags+=("--version")
    two_word_flags+=("-v")
    local_nonpersistent_flags+=("--version")
    local_nonpersistent_flags+=("--version=")
    local_nonpersistent_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_arkade_system_install_go()
{
    last_command="arkade_system_install_go"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--path=")
    two_word_flags+=("--path")
    local_nonpersistent_flags+=("--path")
    local_nonpersistent_flags+=("--path=")
    flags+=("--progress")
    local_nonpersistent_flags+=("--progress")
    flags+=("--version=")
    two_word_flags+=("--version")
    two_word_flags+=("-v")
    local_nonpersistent_flags+=("--version")
    local_nonpersistent_flags+=("--version=")
    local_nonpersistent_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_arkade_system_install_node()
{
    last_command="arkade_system_install_node"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--arch=")
    two_word_flags+=("--arch")
    local_nonpersistent_flags+=("--arch")
    local_nonpersistent_flags+=("--arch=")
    flags+=("--channel=")
    two_word_flags+=("--channel")
    two_word_flags+=("-c")
    local_nonpersistent_flags+=("--channel")
    local_nonpersistent_flags+=("--channel=")
    local_nonpersistent_flags+=("-c")
    flags+=("--path=")
    two_word_flags+=("--path")
    two_word_flags+=("-p")
    local_nonpersistent_flags+=("--path")
    local_nonpersistent_flags+=("--path=")
    local_nonpersistent_flags+=("-p")
    flags+=("--progress")
    local_nonpersistent_flags+=("--progress")
    flags+=("--quiet")
    local_nonpersistent_flags+=("--quiet")
    flags+=("--version=")
    two_word_flags+=("--version")
    two_word_flags+=("-v")
    local_nonpersistent_flags+=("--version")
    local_nonpersistent_flags+=("--version=")
    local_nonpersistent_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_arkade_system_install_node_exporter()
{
    last_command="arkade_system_install_node_exporter"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--path=")
    two_word_flags+=("--path")
    local_nonpersistent_flags+=("--path")
    local_nonpersistent_flags+=("--path=")
    flags+=("--progress")
    local_nonpersistent_flags+=("--progress")
    flags+=("--systemd")
    local_nonpersistent_flags+=("--systemd")
    flags+=("--version=")
    two_word_flags+=("--version")
    two_word_flags+=("-v")
    local_nonpersistent_flags+=("--version")
    local_nonpersistent_flags+=("--version=")
    local_nonpersistent_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_arkade_system_install_prometheus()
{
    last_command="arkade_system_install_prometheus"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--arch=")
    two_word_flags+=("--arch")
    local_nonpersistent_flags+=("--arch")
    local_nonpersistent_flags+=("--arch=")
    flags+=("--path=")
    two_word_flags+=("--path")
    two_word_flags+=("-p")
    local_nonpersistent_flags+=("--path")
    local_nonpersistent_flags+=("--path=")
    local_nonpersistent_flags+=("-p")
    flags+=("--progress")
    local_nonpersistent_flags+=("--progress")
    flags+=("--version=")
    two_word_flags+=("--version")
    two_word_flags+=("-v")
    local_nonpersistent_flags+=("--version")
    local_nonpersistent_flags+=("--version=")
    local_nonpersistent_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_arkade_system_install_pwsh()
{
    last_command="arkade_system_install_pwsh"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--arch=")
    two_word_flags+=("--arch")
    local_nonpersistent_flags+=("--arch")
    local_nonpersistent_flags+=("--arch=")
    flags+=("--path=")
    two_word_flags+=("--path")
    local_nonpersistent_flags+=("--path")
    local_nonpersistent_flags+=("--path=")
    flags+=("--progress")
    local_nonpersistent_flags+=("--progress")
    flags+=("--version=")
    two_word_flags+=("--version")
    two_word_flags+=("-v")
    local_nonpersistent_flags+=("--version")
    local_nonpersistent_flags+=("--version=")
    local_nonpersistent_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_arkade_system_install_registry()
{
    last_command="arkade_system_install_registry"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--arch=")
    two_word_flags+=("--arch")
    local_nonpersistent_flags+=("--arch")
    local_nonpersistent_flags+=("--arch=")
    flags+=("--bind-addr=")
    two_word_flags+=("--bind-addr")
    local_nonpersistent_flags+=("--bind-addr")
    local_nonpersistent_flags+=("--bind-addr=")
    flags+=("--docker-password=")
    two_word_flags+=("--docker-password")
    local_nonpersistent_flags+=("--docker-password")
    local_nonpersistent_flags+=("--docker-password=")
    flags+=("--docker-password-file=")
    two_word_flags+=("--docker-password-file")
    local_nonpersistent_flags+=("--docker-password-file")
    local_nonpersistent_flags+=("--docker-password-file=")
    flags+=("--docker-username=")
    two_word_flags+=("--docker-username")
    local_nonpersistent_flags+=("--docker-username")
    local_nonpersistent_flags+=("--docker-username=")
    flags+=("--overwrite")
    local_nonpersistent_flags+=("--overwrite")
    flags+=("--path=")
    two_word_flags+=("--path")
    local_nonpersistent_flags+=("--path")
    local_nonpersistent_flags+=("--path=")
    flags+=("--progress")
    local_nonpersistent_flags+=("--progress")
    flags+=("--remote-url=")
    two_word_flags+=("--remote-url")
    local_nonpersistent_flags+=("--remote-url")
    local_nonpersistent_flags+=("--remote-url=")
    flags+=("--storage=")
    two_word_flags+=("--storage")
    local_nonpersistent_flags+=("--storage")
    local_nonpersistent_flags+=("--storage=")
    flags+=("--tls=")
    two_word_flags+=("--tls")
    local_nonpersistent_flags+=("--tls")
    local_nonpersistent_flags+=("--tls=")
    flags+=("--type=")
    two_word_flags+=("--type")
    local_nonpersistent_flags+=("--type")
    local_nonpersistent_flags+=("--type=")
    flags+=("--version=")
    two_word_flags+=("--version")
    two_word_flags+=("-v")
    local_nonpersistent_flags+=("--version")
    local_nonpersistent_flags+=("--version=")
    local_nonpersistent_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_arkade_system_install_tc-redirect-tap()
{
    last_command="arkade_system_install_tc-redirect-tap"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--path=")
    two_word_flags+=("--path")
    two_word_flags+=("-p")
    local_nonpersistent_flags+=("--path")
    local_nonpersistent_flags+=("--path=")
    local_nonpersistent_flags+=("-p")
    flags+=("--progress")
    local_nonpersistent_flags+=("--progress")
    flags+=("--version=")
    two_word_flags+=("--version")
    two_word_flags+=("-v")
    local_nonpersistent_flags+=("--version")
    local_nonpersistent_flags+=("--version=")
    local_nonpersistent_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_arkade_system_install_zvol-snapshotter()
{
    last_command="arkade_system_install_zvol-snapshotter"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--dataset=")
    two_word_flags+=("--dataset")
    local_nonpersistent_flags+=("--dataset")
    local_nonpersistent_flags+=("--dataset=")
    flags+=("--path=")
    two_word_flags+=("--path")
    two_word_flags+=("-p")
    local_nonpersistent_flags+=("--path")
    local_nonpersistent_flags+=("--path=")
    local_nonpersistent_flags+=("-p")
    flags+=("--progress")
    local_nonpersistent_flags+=("--progress")
    flags+=("--size=")
    two_word_flags+=("--size")
    local_nonpersistent_flags+=("--size")
    local_nonpersistent_flags+=("--size=")
    flags+=("--systemd")
    local_nonpersistent_flags+=("--systemd")
    flags+=("--version=")
    two_word_flags+=("--version")
    two_word_flags+=("-v")
    local_nonpersistent_flags+=("--version")
    local_nonpersistent_flags+=("--version=")
    local_nonpersistent_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_arkade_system_install()
{
    last_command="arkade_system_install"

    command_aliases=()

    commands=()
    commands+=("actions-runner")
    commands+=("buildkitd")
    commands+=("caddy")
    commands+=("cni")
    commands+=("containerd")
    commands+=("firecracker")
    commands+=("gitlab-runner")
    commands+=("go")
    commands+=("node")
    commands+=("node_exporter")
    commands+=("prometheus")
    commands+=("pwsh")
    commands+=("registry")
    commands+=("tc-redirect-tap")
    commands+=("zvol-snapshotter")

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()


    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_arkade_system()
{
    last_command="arkade_system"

    command_aliases=()

    commands=()
    commands+=("install")
    if [[ -z "${BASH_VERSION:-}" || "${BASH_VERSINFO[0]:-}" -gt 3 ]]; then
        command_aliases+=("i")
        aliashash["i"]="install"
    fi

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()


    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_arkade_uninstall()
{
    last_command="arkade_uninstall"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--kubeconfig=")
    two_word_flags+=("--kubeconfig")
    flags+=("--wait")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_arkade_update()
{
    last_command="arkade_update"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--force")
    local_nonpersistent_flags+=("--force")
    flags+=("--verify")
    local_nonpersistent_flags+=("--verify")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_arkade_version()
{
    last_command="arkade_version"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--json")
    flags+=("-j")
    local_nonpersistent_flags+=("--json")
    local_nonpersistent_flags+=("-j")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_arkade_root_command()
{
    last_command="arkade"

    command_aliases=()

    commands=()
    commands+=("chart")
    if [[ -z "${BASH_VERSION:-}" || "${BASH_VERSINFO[0]:-}" -gt 3 ]]; then
        command_aliases+=("c")
        aliashash["c"]="chart"
    fi
    commands+=("completion")
    commands+=("docker")
    if [[ -z "${BASH_VERSION:-}" || "${BASH_VERSINFO[0]:-}" -gt 3 ]]; then
        command_aliases+=("d")
        aliashash["d"]="docker"
    fi
    commands+=("fstail")
    if [[ -z "${BASH_VERSION:-}" || "${BASH_VERSINFO[0]:-}" -gt 3 ]]; then
        command_aliases+=("ft")
        aliashash["ft"]="fstail"
    fi
    commands+=("get")
    if [[ -z "${BASH_VERSION:-}" || "${BASH_VERSINFO[0]:-}" -gt 3 ]]; then
        command_aliases+=("d")
        aliashash["d"]="get"
        command_aliases+=("download")
        aliashash["download"]="get"
        command_aliases+=("g")
        aliashash["g"]="get"
    fi
    commands+=("gha")
    commands+=("help")
    commands+=("info")
    if [[ -z "${BASH_VERSION:-}" || "${BASH_VERSINFO[0]:-}" -gt 3 ]]; then
        command_aliases+=("f")
        aliashash["f"]="info"
    fi
    commands+=("install")
    if [[ -z "${BASH_VERSION:-}" || "${BASH_VERSINFO[0]:-}" -gt 3 ]]; then
        command_aliases+=("i")
        aliashash["i"]="install"
    fi
    commands+=("oci")
    if [[ -z "${BASH_VERSION:-}" || "${BASH_VERSINFO[0]:-}" -gt 3 ]]; then
        command_aliases+=("o")
        aliashash["o"]="oci"
    fi
    commands+=("search")
    commands+=("system")
    if [[ -z "${BASH_VERSION:-}" || "${BASH_VERSINFO[0]:-}" -gt 3 ]]; then
        command_aliases+=("s")
        aliashash["s"]="system"
    fi
    commands+=("uninstall")
    if [[ -z "${BASH_VERSION:-}" || "${BASH_VERSINFO[0]:-}" -gt 3 ]]; then
        command_aliases+=("delete")
        aliashash["delete"]="uninstall"
    fi
    commands+=("update")
    if [[ -z "${BASH_VERSION:-}" || "${BASH_VERSINFO[0]:-}" -gt 3 ]]; then
        command_aliases+=("u")
        aliashash["u"]="update"
    fi
    commands+=("version")
    if [[ -z "${BASH_VERSION:-}" || "${BASH_VERSINFO[0]:-}" -gt 3 ]]; then
        command_aliases+=("v")
        aliashash["v"]="version"
    fi

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()


    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

__start_arkade()
{
    local cur prev words cword split
    declare -A flaghash 2>/dev/null || :
    declare -A aliashash 2>/dev/null || :
    if declare -F _init_completion >/dev/null 2>&1; then
        _init_completion -s || return
    else
        __arkade_init_completion -n "=" || return
    fi

    local c=0
    local flag_parsing_disabled=
    local flags=()
    local two_word_flags=()
    local local_nonpersistent_flags=()
    local flags_with_completion=()
    local flags_completion=()
    local commands=("arkade")
    local command_aliases=()
    local must_have_one_flag=()
    local must_have_one_noun=()
    local has_completion_function=""
    local last_command=""
    local nouns=()
    local noun_aliases=()

    __arkade_handle_word
}

if [[ $(type -t compopt) = "builtin" ]]; then
    complete -o default -F __start_arkade arkade
else
    complete -o default -o nospace -F __start_arkade arkade
fi

# ex: ts=4 sw=4 et filetype=sh
