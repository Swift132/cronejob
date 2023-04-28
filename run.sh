#/bin/bash
# Script Startup
# 2023 - By: Diogo Pacheco

perm(){
    sudo chmod +x cleandocker.sh
    sudo chmod +x date-script.sh
}

common_error(){
    sudo chmod 666 /var/run/docker.sock
}

create_folders(){

    mkdir data data1 data2

    cd data1
    touch xpto.txt
    cd ..

    cd data2
    touch xpto.txt
    cd ..

}

#Permission do execute
perm

#Corret a common error in docker engine
common_error

#Create Folders
create_folders

#Compose Up
docker compose up --build -d

