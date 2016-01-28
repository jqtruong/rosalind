#! /bin/awk -f

function collect_string() {
    if (!id) return
    fasta_grph[id]["prefix"]=substr(string, 0, k)
    fasta_grph[id]["suffix"]=substr(string, length(string)-(k-1))
    string=""                   # reset for next fasta id
}

function print_grph() {
    for (id in fasta_grph) {
        print id ": " fasta_grph[id]["prefix"] ", " fasta_grph[id]["suffix"]
    }
}

BEGIN {}

# new id
/^>/ {
    collect_string()
    id=substr($0, 2)
}

# multiline bases
/^[ATUCG]+$/ {
    string=string $0
}

END {
    collect_string()
    print_grph()
}
