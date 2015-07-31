#! /bin/bash -e

# Encodes a RNA string into a protein.
# TODO: improve performance;
#       takes a few seconds to encode about 10 kbs into ~3k amino acids.
prot_encode() {
    . defaults/rna-codons

    local string=$(<"$1")
    local protein=

    local aa=                   # amino acid
    for (( i=0; i<${#string}; i+=3 )); do
        aa=${rna_codons[${string:$i:3}]}
        [[ $aa == Stop ]] && break
        protein=$protein$aa
    done

    echo $protein
}
