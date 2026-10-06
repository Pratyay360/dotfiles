
function __complete_bao
    set -lx COMP_LINE (commandline -cp)
    test -z (commandline -ct)
    and set COMP_LINE "$COMP_LINE "
    /var/home/linuxbrew/.linuxbrew/Cellar/openbao/2.5.3/bin/bao
end
complete -f -c bao -a "(__complete_bao)"

