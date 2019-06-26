#!/bin/bash

# Deploy kubernetes dashboard
kubectl apply -f create-service-account.yaml
kubectl apply -f cluster-role-binding.yaml

# Temporary fix to checkout version. Will revert to master once fixes in repo
# kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/master/aio/deploy/recommended/kubernetes-dashboard.yaml
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/65ae1f451f099eccf11a81801eb6739e490a1c46/aio/deploy/recommended/kubernetes-dashboard.yaml
kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep admin-user | awk '{print $1}')

printf '\n Kubernetes dashboard deployed'
printf '\n Run kubectl proxy'
printf '\n Access dashboard and use token above'
printf '\n http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/'

printf '\n'
printf '\n Proceed to deploy templates\n'