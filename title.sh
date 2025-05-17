#!/usr/bin/env bash


name=`basename $1`
name=${name%.dat}
id=`basename $2`


hora=$(awk ' { if($5=='${id}') print $4 }' ./data/${name}.dat | sed -n '1p')
echo $hora
