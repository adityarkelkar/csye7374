# Installing Prometheus, Grafana and related resources
Setup prometheus and grafana to get matrices using the commands mentioned in this document

### Pre-requisites
- A functional k8s cluster with redis and webapp running. Refer [this](https://github.com/adityarkelkar/csye7374-fall2018/tree/assignment4/redis/README.md) and [this](https://github.com/adityarkelkar/csye7374-fall2018/blob/assignment4/webapp/README.md) for more details on how to do that
- `heml` installed. Run `helm version` to check this.

### Run the following commands in the order mentioned to setup your prometheus deployment
```
kubectl apply -f templates/helm_spec.yaml  
kubectl apply -f templates/redis-prometheus-svc.yaml  
helm repo add coreos https://s3-eu-west-1.amazonaws.com/coreos-charts/stable/  
helm init --service-account tiller  
helm install coreos/prometheus-operator --name prometheus-operator --namespace monitoring  
helm install coreos/kube-prometheus --name kube-prometheus --set global.rbacEnable=true --namespace monitoring  
kubectl apply -f templates/service-monitor.yaml  
``` 
***OR***  
Run the `prometheus_setup.sh` script  

### Accessing the metrices
You will need to port forward the necessary pods to access the prometheus and grafana dashboards. Run the following commands to achieve this  
- **Access Prometheus**  
```
kubectl port-forward -n monitoring prometheus-kube-prometheus-0 9090
```
Run `localhost:9090` to access  
- **Access Grafana**  
```
kubectl port-forward $(kubectl get  pods --selector=app=kube-prometheus-grafana -n  monitoring --output=jsonpath="{.items..metadata.name}") -n monitoring  3000
```
Run `localhost:3000` to access