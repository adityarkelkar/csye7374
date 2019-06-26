#!/bin/bash

kubectl apply -f templates/jenkins-deploy.yaml
kubectl apply -f templates/jenkins-service.yaml


kubectl get pods --selector=app=jenkins --output=jsonpath="{.items..metadata.name}"

