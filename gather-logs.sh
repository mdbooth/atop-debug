#!/bin/sh

nodes=$(oc -n atop-debug get pod -l app=atop-debug -o json | \
        jq -re '.items[] | .spec.nodeName')

for node in ${nodes}; do
    mkdir "${node}"
    oc -n atop-debug debug node/"${node}" -- tar -C /host/var/tmp/atop-debug -cf - . | \
        tar -C "${node}" -xvf -
done
