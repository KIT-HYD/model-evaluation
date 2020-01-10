#!/bin/bash

for i in {0..8}
do
    if [ ! -d "logs/logmodel_0$i" ]
    then
        echo "directory doesn't exist. creating now..."
        mkdir -p logs/logmodel_0$i
    fi
done

for i in {1..100}
do
    strace -o logs/logmodel_00/pymodel_00_$i.log -e trace=read python3.6 scripts/pymodel_00.py
    rm -rf pymodel_00_out.csv
    echo 3 > /proc/sys/vm/drop_caches
    date +"%c| pymodel_00 is done & pagecache, dentries and inodes is freed."
    strace -o logs/logmodel_01/pymodel_01_$i.log -e trace=read python3.6 scripts/pymodel_01.py
    rm -rf pymodel_01_out.csv
    echo 3 > /proc/sys/vm/drop_caches
    date +"%c| pymodel_01 is done & pagecache, dentries and inodes is freed."
    strace -o logs/logmodel_02/pymodel_02_$i.log -e trace=read python3.6 scripts/pymodel_02.py
    rm -rf pymodel_02_out.csv
    echo 3 > /proc/sys/vm/drop_caches
    date +"%c| pymodel_02 is done & pagecache, dentries and inodes is freed."
    strace -o logs/logmodel_03/pymodel_03_$i.log -e trace=read python3.6 scripts/pymodel_03.py
    rm -rf pymodel_03_out.csv
    echo 3 > /proc/sys/vm/drop_caches
    date +"%c| pymodel_03 is done & pagecache, dentries and inodes is freed."
    strace -o logs/logmodel_04/pymodel_04_$i.log -e trace=read python3.6 scripts/pymodel_04.py
    rm -rf pymodel_04_out.csv
    echo 3 > /proc/sys/vm/drop_caches
    date +"%c| pymodel_04 is done & pagecache, dentries and inodes is freed."
    strace -o logs/logmodel_05/pymodel_05_$i.log -e trace=read python3.6 scripts/pymodel_05.py
    rm -rf pymodel_05_out.csv
    echo 3 > /proc/sys/vm/drop_caches
    date +"%c| pymodel_05 is done & pagecache, dentries and inodes is freed."
    strace -o logs/logmodel_06/pymodel_06_$i.log -e trace=read python3.6 scripts/pymodel_06.py
    rm -rf pymodel_06_out.csv
    echo 3 > /proc/sys/vm/drop_caches
    date +"%c| pymodel_06 is done & pagecache, dentries and inodes is freed."
    strace -o logs/logmodel_07/pymodel_07_$i.log -e trace=read python3.6 scripts/pymodel_07.py
    rm -rf pymodel_07_out.csv
    echo 3 > /proc/sys/vm/drop_caches
    date +"%c| pymodel_07 is done & pagecache, dentries and inodes is freed."
    strace -o logs/logmodel_08/pymodel_08_$i.log -e trace=read python3.6 scripts/pymodel_08.py
    rm -rf pymodel_08_out.csv
    echo 3 > /proc/sys/vm/drop_caches
    date +"%c| pymodel_08 is done & pagecache, dentries and inodes is freed."
    date +"%c| --- run number "$i" is done ---"
done

echo All done
