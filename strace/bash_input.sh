#!/bin/bash

for i in {1..4}
do
    if [ ! -d "logs/loginput/logmodel_0$i" ]
    then
        echo "directory doesn't exist. creating now..."
        mkdir -p logs/loginput/logmodel_0$i
    fi
done

for i in {1..100}
do
    strace -o logs/loginput/logmodel_01/pymodel_01_$i.log -e trace=read python3.6 scripts/q_host_in.py
    echo 3 > /proc/sys/vm/drop_caches
    date +"%c| q_host_in is done & pagecache, dentries and inodes is freed."
    strace -o logs/loginput/logmodel_02/pymodel_02_$i.log -e trace=read python3.6 scripts/p_ebni_in.py
    echo 3 > /proc/sys/vm/drop_caches
    date +"%c| p_ebni_in is done & pagecache, dentries and inodes is freed."
    strace -o logs/loginput/logmodel_03/pymodel_03_$i.log -e trace=read python3.6 scripts/p_ebni_min_in.py
    echo 3 > /proc/sys/vm/drop_caches
    date +"%c| p_ebni_min_in is done & pagecache, dentries and inodes is freed."
    strace -o logs/loginput/logmodel_04/pymodel_04_$i.log -e trace=read python3.6 scripts/p_ebni_int_in.py
    echo 3 > /proc/sys/vm/drop_caches
    date +"%c| p_ebni_int_in is done & pagecache, dentries and inodes is freed."
    date +"%c| --- run number "$i" is done ---"
done

echo All done
