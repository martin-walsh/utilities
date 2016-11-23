#!/bin/bash

printf "Deleting RAM Disk '/dev/$1'\n"
umount /dev/$1
hdiutil detach /dev/$1
