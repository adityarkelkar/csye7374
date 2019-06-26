# Redis cluster with 3 Redis servers in master/slave configuration
This project sets up a Redis cluster with 3 Redis servers in master/slave configuration on a kubernetes setup based off AWS

### Pre-requisites
- A functional k8s cluster with minimum 1 master node and 3 worker nodes. Recommended instance types(considering minimum AWS related costs) are T2.Micro for both master and workers

### Directory Structure
- All kubernetes yaml templates are present in the /redis/templates directory

### Setup the Cluster
- To setup the redis cluster, simply run the `redis-setup.sh` script in the /redis directory

### Templates
- `master-replica.yaml`: A replicaset which will create a master redis server along with the redis sentinel
- `slave-replica.yaml` : A replicaset which will create a 2 redis slave servers along with the redis sentinel on each of the pod
- `redis-sentinel-service.yaml` : A service used to provide an endpoint to the redis sentinels
- `nodeport-service.yaml` : Expose the server and sentinel ports for external access

### Test the replicasets with `redis-cli`
- Once `setup.sh` executes, run the following commands to check if the cluster setup is in order:
	1. `$ kubectl get pods` : You should see all pods are in running state
	2. `$ kubectl get svc`  : You should see all services currently installed on your k8s
	3. `$ kubectl describe pod POD-NAME` : Get more details about a pod using this command
- Manual Step: In your AWS console, update the incoming traffic on your master and worker nodes with a Custom TCP in the range 30000-35000 and a CIDR of 0.0.0.0/0.
- Run `$ redis-cli -h <HOSTNAME> -p <PORT_NUMBER>`
- Type `ping`. You should receive a response `PONG`. You can execute other redis-cli commands once you get a successful response from the console


### Teardown Created Resources
- Run the `redis-teardown.sh` script to terminate **only** the redis resources on the k8s cluster.
- **This will not terminate the k8s cluster in AWS. To delete the k8s cluster, run the kops delete cluster command as specified in the link above**

