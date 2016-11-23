#!/bin/bash

PID=`cat /Volumes/ram_disk/mysql/data/*.pid`
kill $PID &

sleep 5

delete-ram-disk disk2
