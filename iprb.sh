#! /bin/bash -e

. lib/calc.sh

# Probability of a dominant allele in offspring.
mendel-dom-prb() {
    local data=($(<"$1"))
    local k="${data[0]}" m="${data[1]}" n="${data[2]}"
    local t=$(calc "$k + $m + $n")
    local kk=$(calc "$k/$t * ($k-1)/($t-1)")
    local km=$(calc "$k/$t * $m/($t-1) * 2")
    local kn=$(calc "$k/$t * $n/($t-1) * 2")
    local mm=$(calc "$m/$t * ($m-1)/($t-1) * 3/4")
    local mn=$(calc "$m/$t * $n/($t-1)")
    
    calc "$kk + $km + $kn + $mm + $mn"
}
