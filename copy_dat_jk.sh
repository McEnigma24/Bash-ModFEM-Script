#!/bin/sh

current=$PWD
echo -n copying...
cp "$PWD"/"$1"/*.dat "$PWD"/"$2"
cp "$PWD"/"$1"/*.jk "$PWD"/"$2"
echo done
