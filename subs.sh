#! /bin/bash -e

# Returns the 1-based numbering position of a motif in a DNA strand.
motif_pos() {
    local data=() s= t=
    read -d '\n' -a data <"$1"
    s=${data[0]}
    t=${data[1]}

    local len=${#t} pos=()
    for (( i=0; i<${#s}; i++ )); do
        [[ ${s:$i:$len} == $t ]] && pos+=($((i+1)))
    done

    echo "${pos[@]}"
}
