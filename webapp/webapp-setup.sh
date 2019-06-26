#!/bin/bash

export REDISHOST_IP=$(kubectl describe pod -l role=master | grep -w "^IP:" | awk '{print $2}')
kubectl create configmap redishost --from-literal=REDISHOST=${REDISHOST_IP}
kubectl create configmap csye7374-port --from-literal=port=8080	
kubectl get configmaps redishost -o yaml

kubectl apply -f csye-app.yaml
kubectl apply -f csye-service.yaml