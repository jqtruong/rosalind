#! /bin/bash -e

# Calculate the consensus string and the profile matrix.
#
# TODO: improve performance.
cons() {
    local fasta=($( echo "$(<"$1")" | ./lib/fasta.awk ))
    local bases=(A C G T)
    local As=() Cs=() Gs=() Ts=()
    local col= cons= str= winner=

    # Lengths should all be the same and getting an array without an index conveniently gives the last item.
    local len=$(echo -n "${fasta##*:}" | wc -m)

    # Strip fasta ids and just keep the strings for this problem.
    for (( i=0; i<$len; i++ )); do
        col=
        for f in "${fasta[@]}"; do
            str="${f##*:}"
            col+="${str:$i:1}"
        done
        col=($(echo $col | grep -o . | ./lib/nts.awk))
        # Is there a better way? awk can do so much more and wondering if i could use its multi-dimensional arrays
        # capabilities.
        winner=$(echo "${col[@]}" | sed 's/ //g' | grep -o . | ./lib/max-index.awk)
        cons+=${bases[$winner]}
        As+=(${col[0]})
        Cs+=(${col[1]})
        Gs+=(${col[2]})
        Ts+=(${col[3]})
    done

    echo $cons
    echo "A: ${As[@]}"
    echo "C: ${Cs[@]}"
    echo "G: ${Gs[@]}"
    echo "T: ${Ts[@]}"
}
