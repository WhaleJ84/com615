#!/bin/sh

for HOST in $*; do
  ping -c10 $HOST
done