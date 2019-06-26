#!/bin/bash

set -e


#Set all the variables in this section
CLUSTER_NAME="k8s.local"
CLOUD_PROVIDER=aws
IMAGE=k8s.gcr.io/cluster-autoscaler:v1.1.0
MIN_NODES=1
MAX_NODES=20
AWS_REGION=us-east-1
GROUP_NAME="nodes"
ASG_NAME="${GROUP_NAME}.${CLUSTER_NAME}"   #ASG_NAME should be the name of ASG as seen on AWS console. 
#IAM_ROLE="masters.${CLUSTER_NAME}"                  #Where will the cluster-autoscaler process run? Currently on the master node. 
SSL_CERT_PATH="/etc/ssl/certs/ca-certificates.crt"  #(/etc/ssl/certs for gce, /etc/ssl/certs/ca-bundle.crt for RHEL7.X)
#KOPS_STATE_STORE="s3://___"        #KOPS_STATE_STORE might already be set as an environment variable, in which case it doesn't have to be changed.

addon=cluster-autoscaler.yml
wget -O ${addon} https://raw.githubusercontent.com/kubernetes/kops/master/addons/cluster-autoscaler/v1.8.0.yaml

sed -i -e "s@{{CLOUD_PROVIDER}}@${CLOUD_PROVIDER}@g" "${addon}"
sed -i -e "s@{{IMAGE}}@${IMAGE}@g" "${addon}"
sed -i -e "s@{{MIN_NODES}}@${MIN_NODES}@g" "${addon}"
sed -i -e "s@{{MAX_NODES}}@${MAX_NODES}@g" "${addon}"
sed -i -e "s@{{GROUP_NAME}}@${ASG_NAME}@g" "${addon}"
sed -i -e "s@{{AWS_REGION}}@${AWS_REGION}@g" "${addon}"
sed -i -e "s@{{SSL_CERT_PATH}}@${SSL_CERT_PATH}@g" "${addon}"

kubectl apply -f ${addon}

printf "Done\n"
