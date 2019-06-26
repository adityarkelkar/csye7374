# Sample web application to test redis connection and load balancing
- This webapp is a simple REST api that will return all environment variables set inside the docker container
- It will also return the pod from which the request is serviced and the hit counter on that pod

### Steps to run the webapp
- Build Docker container first and reference it in the csye-app.yaml image
- Run the script `webapp-setup.sh`
