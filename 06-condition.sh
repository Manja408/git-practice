#!/bin/bash

NUMBER=$1

if [$NUMBER -gt] #gt(greter than),lt(less than),eq(equal to),-ne,-ge,-le
then    
    echo "Given number: $NUMBER is greter than 20"
else
    echo "Given number: $NUMBER is less than 20"
fi