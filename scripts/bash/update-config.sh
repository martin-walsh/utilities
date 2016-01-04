#!/bin/bash

printf "\nUpdating AU...\n"
cd $HOME/"code/config-au"
git pull

printf "\nUpdating UK...\n"
cd $HOME/"code/config-uk"
git pull

printf "\nUpdating STG...\n"
cd $HOME/"code/config-stg"
git pull

printf "\nUpdating CMBETA...\n"
cd $HOME/"code/config-cmbeta"
git pull

printf "\nUpdating TPI...\n"
cd $HOME/"code/config-tpi"
git pull

printf "\nUpdating SYS...\n"
cd $HOME/"code/config-sys"
git pull

printf "\nUpdating UAT...\n"
cd $HOME/"code/config-uat"
git pull
