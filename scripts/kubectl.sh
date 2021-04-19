#!/bin/bash
. ./scripts/env_variables.sh

kubectl delete namespace ${INSTANCE_NAME}
if [[ $? -ne 0 ]]
then
   exit 1  
fi
kubectl delete pv ${INSTANCE_NAME}-volume
if [[ $? -ne 0 ]]
then
   exit 1  
fi
