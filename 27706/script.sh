#!/bin/bash

set -x

echo "Hello!"

my_outg="${outgoing}"
declare -a oarray
oarray=($(echo $my_outg | tr "," " "))