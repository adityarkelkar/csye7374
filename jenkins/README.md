# Jenkins Deployment for CI/CD

1. Created a kops cluster
2. Deploy jenkins on it. Wait for loadbalancer to come up
3. Setup jenkins. 
	- Disable CORS from global security 
	- Add github authentication, ssh plugins
4. Add the following credentials to your jenkins server
	- Setup github username and password credentials in jenkins
	- Private SSH key for kubernetes master
	- Github global account credentials
5. To SSH into the master
```
#!/usr/bin/env bash
ssh -v -i ${SSH_KEYFILE} -o StrictHostKeyChecking=no ${SSH_USERNAME}@${SSH_HOSTNAME}
```
