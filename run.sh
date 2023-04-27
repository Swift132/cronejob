#!/bin/bash

mkdir data data1 data2

cd data1
touch xpto.txt
cd ..

cd data2
touch xpto.txt
cd ..

docker compose up -d

