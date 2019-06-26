#!/bin/bash

kubectl apply -f templates/helm_spec.yaml
kubectl apply -f templates/redis-prometheus-svc.yaml
helm repo add coreos https://s3-eu-west-1.amazonaws.com/coreos-charts/stable/
helm init --service-account tiller
echo "Setting up prometheus operator....."
sleep 20 
helm install coreos/prometheus-operator --name prometheus-operator --namespace monitoring
helm install coreos/kube-prometheus --name kube-prometheus --set global.rbacEnable=true --namespace monitoring
kubectl apply -f templates/service-monitor.yaml