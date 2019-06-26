#!/bin/bash

kubectl delete configmap redishost 
kubectl delete configmap csye7374-port


kubectl delete -f csye-app.yaml
kubectl delete -f csye-service.yaml

