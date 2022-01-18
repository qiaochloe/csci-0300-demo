#!/bin/sh

# Simple test script to check whether every command used in the course works.
# Assuming (my) implementation passes all tests, this script should terminate
# without any error.

PROJECT_DIR=./projects

set -e

cd $PROJECT_DIR

cd dmalloc
make clean && make check
make clean && make SAN=1 check-1-26
cd ..

cd fileio
make clean && make check IMPL=naive
make clean && make check IMPL=stdio
make clean && make check IMPL=student
make perf
cd ..

cd vunmo
make clean && make check
cd ..