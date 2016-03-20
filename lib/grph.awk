#! /bin/awk -f

##########
# params #
##########
# `k' is the number of bases (ACTG) to grab prefixes and suffixes from
# the fasta strings

function map() {
}

BEGIN {}

NF {
    id=$1
    prefix=substr($2, 0, k)
    suffix=substr($2, length($2) - (k - 1))
    print prefix, id, suffix
}

END {}
