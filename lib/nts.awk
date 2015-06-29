#! /bin/awk -f

BEGIN {}

{
    bases[$0]++
}

END {
    printf "%d %d %d %d",
        bases["A"],
        bases["C"],
        bases["G"],
        bases["T"]
}
