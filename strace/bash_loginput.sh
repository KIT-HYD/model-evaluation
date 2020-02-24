#!/bin/bash

file=logs/loginput/avg_read.log
if [ ! -e "$file" ] ; then
    touch "$file"
fi

for i in {1..4}
do
    FILES=logs/loginput/logmodel_0$i/pymodel_0${i}_*
    ef=logs/loginput/logmodel_0$i/sum_pymodel_0$i.csv
    
    if [ ! -e "$ef" ] ; then
    touch "$ef"
    fi
    
    for f in $FILES
    do
        cat $f | awk 'BEGIN {FS="="}{sum += $2} END {print sum}' >> "$ef"
    done
    
    cat $ef | awk -v i=$i 'BEGIN {FS="\n"}{avg = (sume += $1) / 100} END {printf("avgerage read of pymodel_0%s: %.2f, \n", i, avg)}' >> "$file"
done
