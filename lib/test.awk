#! /bin/awk -f

BEGIN {

}

# /[[:digit:]]/ {
#     print "got two"
# }

# /^>/ {
#     print "got one"
# }

/start/, /stop/ {
    print
}

END {

}
