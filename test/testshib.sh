#!/bin/bash

# Sign on to sp.testshib.org using ipd.testshib.org
# A successful result will write recent lines from the SP logfile to testshib.out

webisoget -verbose \
    -out testshib.out \
    -formfile testshib.login \
    -url https://sp.testshib.org/