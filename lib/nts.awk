#! /bin/awk -f

# prints out base counts for A, C, G, and T

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
