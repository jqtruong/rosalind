#! /bin/awk -f

########
# main #
########
BEGIN { RS=">" }

NF {
    id=$1
    dna=""
    for (i=2; i<=NF; i++) {
        dna=dna $i
    }
    print id,dna
}

END {}
