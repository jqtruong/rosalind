#! /bin/bash -e

count_nts() {
    # upper case dna string
    local DNA="${1^^}"

    declare -A NTS=(
        [A]="${DNA//[^A]}"
        [C]="${DNA//[^C]}"
        [G]="${DNA//[^G]}"
        [T]="${DNA//[^T]}"
    )

    echo "${#NTS[A]} ${#NTS[C]} ${#NTS[G]} ${#NTS[T]}"
}
