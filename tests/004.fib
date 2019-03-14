#! /bin/bash -e

# testing the waters with testing bash scripts...
# might get back to it one day

file="${0%/*}/../${0##*/}"
[[ ! -f $file ]] && echo "No such file: $file." && exit 1 || . $file

EMSG_MONTH="Month not specified."
read ERR <<<$(rabbit_fib 2>&1)
[[ ! "$EMSG_MONTH" == "$ERR" ]] && echo "Expected '$EMSG_MONTH' but got '$ERR'." && exit 1

echo "All is well."
