echo "Starting Minikube"

# Start minikube
minikube start

echo 
echo 
echo "Starting deploy on Kubernetes"

# Deploying on kubernetes 
kubectl apply -f yamls/namespace.yml
kubectl apply -f yamls/nginx.yml
kubectl apply -f yamls/postgres.yml
kubectl apply -f yamls/adminer.yml
kubectl apply -f yamls/minio.yml


# Getting the public IP of VM

echo 
echo 
echo "Getting the public IP on minikube VM."
echo 

IP=`kubectl get nodes -o jsonpath={.items[*].status.addresses[?\(@.type==\"InternalIP\"\)].address}`
echo "The Public IP of MINIKUBE is: $IP"


#HOST="aigent.web.app"
#echo "$IP $HOST" | sudo tee -a /etc/hosts

echo 
echo "Use the following URLs to access the systems inside kubernetes:" 
echo "- Nginx: http://$IP:31283"
echo "- Postgres: http://$IP:31132"
echo "- Adminer: http://$IP:30525"
echo "- Minio: http://$IP:30900"
echo
echo

echo "BE PATIENT, MINIO TAKE SOME TIME TO FINALIZE ITS STARTUP PROCESS. Grab a cup of coffee!"
echo