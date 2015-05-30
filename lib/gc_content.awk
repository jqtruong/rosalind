#! /bin/awk -f

BEGIN {}

{
    divisor=length($0)
    dividend=divisor - gsub(/[^GC]/, "")
    # printf "%d / %d = %f", dividend, divisor, dividend/divisor*100
    printf "%f", dividend/divisor*100
}

END {}
