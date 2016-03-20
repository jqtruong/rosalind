#! /bin/awk -f

BEGIN {
    id=""
    string=""
}

# FASTA lines that start with '>' specify an ID. As it loops through
# the data rows, collected strings are stored for later printing.
/^>/ {
    if (id) {
        fasta[id]=string
        string=""
    }
    id=substr($0, 2)
}

# Valid DNA data should only contain these bases: A, T/U, C, G.
# FASTA data contains a DNA strand's bases on multiple lines.
/^[ATUCG]+$/ {
    string=string $0
}

END {
    # Record last entry.
    fasta[id]=string

    for (id in fasta) {
        print id ":" fasta[id]
    }
}
