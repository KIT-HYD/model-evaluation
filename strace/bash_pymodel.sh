#!/bin/bash

cd scripts

for i in {0..9}
do
    if [ ! -d "../logs/logmodel_0$i" ]
    then
        echo "directory doesn't exist. creating now..."
        mkdir -p ../logs/logmodel_0$i
    fi
done

tr=read

for i in {1..100}
do
    for j in {0..9}
    do
        strace -o ../logs/logmodel_0$j/pymodel_0${j}_$i.log -e trace=$tr python3.6 pymodel_0$j.py
        rm -rf ../data/model_0${j}_out.csv
        echo 3 > /proc/sys/vm/drop_caches
        date +"%c| pymodel_0$j is done & pagecache, dentries and inodes is freed."
    done
    date +"%c| --- run number "$i" is done ---"
done

echo All done
