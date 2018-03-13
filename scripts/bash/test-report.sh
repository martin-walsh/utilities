#!/usr/bin/env bash

if [ -f target/test-reports/html/failed.html ]; then
    open target/test-reports/html/failed.html
fi

if [ -f build/reports/tests/test/index.html ]; then
    open build/reports/tests/test/index.html
fi
