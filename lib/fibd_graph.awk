#! /bin/awk -f

BEGIN {
    i = 0
}

{
    if ($0 == "+") {
        s = "+"
    } else {
        n = ($0 + 1)
        if (n == m) {
            s = "+ 0"
        } else if (n > 1) {
            s = n
            for (j=0; j<k; j++) {
                s = s" 0"
            }
        } else {
            s = n
        }
    }

    iter[i++] = s
}

END {
    res = iter[0]
    for (i=1; i<length(iter); i++) {
        res = res" "iter[i]
    }

    print res
}
