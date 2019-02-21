#!/bin/bash

ef_00=logs/logmodel_00/sum_pymodel_00.csv
ef_01=logs/logmodel_01/sum_pymodel_01.csv
ef_02=logs/logmodel_02/sum_pymodel_02.csv
ef_03=logs/logmodel_03/sum_pymodel_03.csv
ef_04=logs/logmodel_04/sum_pymodel_04.csv
ef_05=logs/logmodel_05/sum_pymodel_05.csv
ef_06=logs/logmodel_06/sum_pymodel_06.csv

file="logs/avg_read.log"
if [ -f $file ] ; then
    rm -f $file
fi

FILES_00=logs/logmodel_00/pymodel_00_*
for f in $FILES_00
    do
    cat $f | awk 'BEGIN {FS="="}{sum += $2} END {print sum >> "logs/logmodel_00/sum_pymodel_00.csv"}'
    done
cat $ef_00 | awk 'BEGIN {FS="\n"}{avg = (sume += $1) / 100} END {printf("avgerage read of pymodel_00: %.2f, \n", avg) >> "logs/avg_read.log"}'

FILES_01=logs/logmodel_01/pymodel_01_*
for f in $FILES_01
    do
    cat $f | awk 'BEGIN {FS="="}{sum += $2} END {print sum >> "logs/logmodel_01/sum_pymodel_01.csv"}'
    done
cat $ef_01 | awk 'BEGIN {FS="\n"}{avg = (sume += $1) / 100} END {printf("avgerage read of pymodel_01: %.2f, \n", avg) >> "logs/avg_read.log"}'

FILES_02=logs/logmodel_02/pymodel_02_*
for f in $FILES_02
    do
    cat $f | awk 'BEGIN {FS="="}{sum += $2} END {print sum >> "logs/logmodel_02/sum_pymodel_02.csv"}'
    done
cat $ef_02 | awk 'BEGIN {FS="\n"}{avg = (sume += $1) / 100} END {printf("avgerage read of pymodel_02: %.2f, \n", avg) >> "logs/avg_read.log"}'

FILES_03=logs/logmodel_03/pymodel_03_*
for f in $FILES_03
    do
    cat $f | awk 'BEGIN {FS="="}{sum += $2} END {print sum >> "logs/logmodel_03/sum_pymodel_03.csv"}'
    done
cat $ef_03 | awk 'BEGIN {FS="\n"}{avg = (sume += $1) / 100} END {printf("avgerage read of pymodel_03: %.2f, \n", avg) >> "logs/avg_read.log"}'

FILES_04=logs/logmodel_04/pymodel_04_*
for f in $FILES_04
    do
    cat $f | awk 'BEGIN {FS="="}{sum += $2} END {print sum >> "logs/logmodel_04/sum_pymodel_04.csv"}'
    done
cat $ef_04 | awk 'BEGIN {FS="\n"}{avg = (sume += $1) / 100} END {printf("avgerage read of pymodel_04: %.2f, \n", avg) >> "logs/avg_read.log"}'

FILES_05=logs/logmodel_05/pymodel_05_*
for f in $FILES_05
    do
    cat $f | awk 'BEGIN {FS="="}{sum += $2} END {print sum >> "logs/logmodel_05/sum_pymodel_05.csv"}'
    done
cat $ef_05 | awk 'BEGIN {FS="\n"}{avg = (sume += $1) / 100} END {printf("avgerage read of pymodel_05: %.2f, \n", avg) >> "logs/avg_read.log"}'

FILES_06=logs/logmodel_06/pymodel_06_*
for f in $FILES_06
    do
    cat $f | awk 'BEGIN {FS="="}{sum += $2} END {print sum >> "logs/logmodel_06/sum_pymodel_06.csv"}'
    done
cat $ef_06 | awk 'BEGIN {FS="\n"}{avg = (sume += $1) / 100} END {printf("avgerage read of pymodel_06: %.2f, \n", avg) >> "logs/avg_read.log"}'
