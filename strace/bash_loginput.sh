#!/bin/bash

ef_01=logs/loginput/logmodel_01/sum_pymodel_01.csv
ef_02=logs/loginput/logmodel_02/sum_pymodel_02.csv
ef_03=logs/loginput/logmodel_03/sum_pymodel_03.csv
ef_04=logs/loginput/logmodel_04/sum_pymodel_04.csv

file="logs/loginput/avg_read.log"
if [ -f $file ] ; then
    rm -f $file
fi

FILES_01=logs/loginput/logmodel_01/pymodel_01_*
for f in $FILES_01
    do
    cat $f | awk 'BEGIN {FS="="}{sum += $2} END {print sum >> "logs/loginput/logmodel_01/sum_pymodel_01.csv"}'
    done
cat $ef_01 | awk 'BEGIN {FS="\n"}{avg = (sume += $1) / 100} END {printf("avgerage read of pymodel_01: %.2f, \n", avg) >> "logs/loginput/avg_read.log"}'

FILES_02=logs/loginput/logmodel_02/pymodel_02_*
for f in $FILES_02
    do
    cat $f | awk 'BEGIN {FS="="}{sum += $2} END {print sum >> "logs/loginput/logmodel_02/sum_pymodel_02.csv"}'
    done
cat $ef_02 | awk 'BEGIN {FS="\n"}{avg = (sume += $1) / 100} END {printf("avgerage read of pymodel_02: %.2f, \n", avg) >> "logs/loginput/avg_read.log"}'

FILES_03=logs/loginput/logmodel_03/pymodel_03_*
for f in $FILES_03
    do
    cat $f | awk 'BEGIN {FS="="}{sum += $2} END {print sum >> "logs/loginput/logmodel_03/sum_pymodel_03.csv"}'
    done
cat $ef_03 | awk 'BEGIN {FS="\n"}{avg = (sume += $1) / 100} END {printf("avgerage read of pymodel_03: %.2f, \n", avg) >> "logs/loginput/avg_read.log"}'

FILES_04=logs/loginput/logmodel_04/pymodel_04_*
for f in $FILES_04
    do
    cat $f | awk 'BEGIN {FS="="}{sum += $2} END {print sum >> "logs/loginput/logmodel_04/sum_pymodel_04.csv"}'
    done
cat $ef_04 | awk 'BEGIN {FS="\n"}{avg = (sume += $1) / 100} END {printf("avgerage read of pymodel_04: %.2f, \n", avg) >> "logs/loginput/avg_read.log"}'

