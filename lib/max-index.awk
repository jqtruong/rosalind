#! /bin/awk -f

BEGIN {
    winner=0
    current=0
    top=0
}

{
    if ($0 >= top) {
        top=$0
        winner=current
    }

    current++
}

END {
    print winner
}
