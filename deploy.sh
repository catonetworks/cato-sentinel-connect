#!/bin/bash

echo "building azure functionapp binary..."

cd source 

GOOS=linux GOARCH=amd64 go build -o ../deploy/events *.go

cd ../deploy/

echo "removing older zip (if applicable)"

rm -fv ../deploy-se.zip

echo "zipping needed files..."

zip -rv ../deploy-se.zip *

echo "done"