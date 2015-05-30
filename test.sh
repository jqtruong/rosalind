#! /bin/bash -e

foo() {
    local bar() {
        echo "bar"
    }

    echo "foo"
}

foo

