#! /bin/bash -e

reverse_complement() {
    . defaults/base-pairs

    local rev=$(echo "${1^^}" | rev)
    local comp=

    for (( i=0; i<${#rev}; i++ )); do
        comp+=${base_pairs[${rev:$i:1}]}
    done

    echo "$comp"
}
