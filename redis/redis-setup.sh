#!/bin/bash

kubectl create secret generic db-pass --from-file=./db.pass
kubectl apply -f templates/master-replica.yaml
kubectl apply -f templates/master-service.yaml
kubectl apply -f templates/redis-sentinel-service.yaml
kubectl apply -f templates/nodeport-service.yaml
kubectl apply -f templates/slave-replica.yaml
kubectl apply -f templates/slave-service.yaml

echo "Redis deployment done ....... Proceed to webapp deployment"
