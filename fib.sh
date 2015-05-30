#! /bin/bash -e

. lib/calc.sh

rabbit_fib() {
    local pairs=()
    local month=$1; ((month--))
    local offsprings=$2

    # assuming that index 0 and 1 always output 1...
    [[ $month -le 1 ]] && echo 1 && exit 0

    # get pairs from or create file
    local mem="values/rabbit-fib-mem.$offsprings"
    [[ -f $mem ]] && pairs=($(<$mem)) || touch $mem

    # output found index if already calculated
    [[ ${pairs[$month]} ]] && echo ${pairs[$month]} && exit 0

    # now let's get down and dirty
    [[ ${#pairs[@]} -eq 0 ]] && pairs+=(1 1)

    local i=${#pairs[@]}; ((i--))
    local j=$((i - 1))
    local batch1= batch2=       # batch of bunny pairs from one and two months ago
    while [[ $i -lt $month ]]; do
        batch1=${pairs[$i]}; batch2=${pairs[$j]}
        pairs+=($(calc "$batch1 + ($batch2 * $offsprings)"))
        j=$((i++))
    done

    echo "${pairs[@]}" > $mem
    echo ${pairs[$month]}
}
