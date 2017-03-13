#!/bin/bash

my_nodes=( $(mpirun --pernode hostname) )

for node in ${my_nodes[@]}; do
  for core in {1..16}; do
    mpirun -np 1 --bind-to none --report-bindings --host $node sleep 10 &
  done
done 

wait
