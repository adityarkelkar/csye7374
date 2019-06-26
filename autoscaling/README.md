# Autoscaling in Kubernetes
-  In this section, we will implement pod based and cluster based autoscaling on a k8s cluster

### Pre-requisites
- A functional k8s cluster with minimum 1 master node and 3 worker nodes. Recommended instance types(considering minimum AWS related costs) are T2.Micro for both master and workers
- Deploy redis on the cluster. Refer **<a href="https://github.com/adityarkelkar/csye7374-fall2018/blob/master/redis/README.md">this</a>** section for more details
- Deploy the sample web app on the cluster. Refer **<a href="https://github.com/adityarkelkar/csye7374-fall2018/blob/master/webapp/README.md">this</a>** section for more details
- Deploy the tiller pod using **<a href="https://github.com/adityarkelkar/csye7374-fall2018/blob/master/prometheus/README.md">this</a>** script. We have a functional prometheus metric bundled with it

### Pod Autoscaling
- Run the script to deploy the metrics server. This will implement metrics for the webapp
```
./pod/deploymetrics.sh
```
- To test pod autoscaling, hit multiple requests on the webapp loadbalancer url using a loop
```
while true; do curl {LOADBALANCER-URL}; done
```
- Check the dashboard. There should be additional pods for the webapp

### Cluster Autoscaling
- Attach the IAM Policy `AutoScalingFullAccess`  to the kops group. This will give the kops user access to autoscale pods and clusters
- Edit the min and max node count in the node instance group using this command
```
kops edit ig nodes
```
Once you finish editing, run a update and rolling-update on the cluster
```
kops update cluster --yes --name $NAME
kops rolling-update cluster
```
- To deploy cluster autoscaling, edit the `scale-cluster.sh` in the `cluster` folder
- Replace the variables environment variables as per your cluster configuration
- Run the script
```
./cluster/scale-cluster.sh
```
- To test cluster autoscaling, add additional pod replicas to any of the running deployment and check the cluster scale up on the console.
- After removing the additional replicas, and see the cluster scale down after some time
- For more information on scaling, check the autoscaling pod logs in the `kube-system` namespace