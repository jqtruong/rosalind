#! /bin/bash -e

hamming_dist() {
    local strings=() string1= string2=

    read -d '\n' -a strings <"$1"
    string1=${strings[0]}
    string2=${strings[1]}

    [[ ${#string1} -ne ${#string2} ]] &&
        echo "Strings must be of equal lengths to calculate the Hamming distance." >&2 &&
        exit 1

    local d=0
    for (( i=0; i<${#string1}; i++ )); do
        [ ${string1:$i:1} != ${string2:$i:1} ] && ((d++))
    done

    echo $d
}
