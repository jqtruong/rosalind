#! /bin/bash -e

transcribe() {
    local RNA="${1^^}"

    echo "${RNA//T/U}"
}
