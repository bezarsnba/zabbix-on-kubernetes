## Introduction

- In this repository contains files necessary to provisioning Zabbix in Kubernetes through Minikube

# Pre requisito

- Minikube v1.9.1
- Kubernetes v1.18.0 

# File structure

- cadvisor.yaml - In this file contains configurantion to monitoring and export metrics of the CADVISOR
- clusterRole-monitoring.yaml - Roles do prometheus
- confimaps.yaml - In this yaml file , contains variables to using to the other files.
- nampespace.yaml - In this yaml file, contains namespace setup
- zabbix-agent-deployment.yaml - In this yaml file, contains configuration of the Zabbix Agente, was used  Statefulset, PVC and PV
- zabbix-db-mysql.yaml -  In this yaml file, contains configuration of the Database MySql, was used  Statefulset, Service, StorageClass, PVC.PV
- zabbix-server-deployment.yaml - In this yaml file, contains configuration of the Zabbix Server, was used  Statefulset and Service.
- zabbix-webnginx-deployment.yaml - In this yaml file, contains configuration of the FrontEnd was used  Statefulset and Service.


# Step by Step


1- Execute the apply to create namespace.

```
kubectl apply -f namespace.yaml
```

2- Execute the apply to create configmaps
```
kubectl apply -f configmaps.yaml
```

3 - Execute the apply to create secrtetes
```
kubectl apply -f secretes.yaml
```

4 - Execute the apply to create database
```
kubectl apply -f database-mysql.yaml 
```

5 - Execute the apply to create zabbix-agent
```
kubectl apply -f zabbix-agent.yaml
```

6- Execute the apply to create zabbix-server

```
 kubectl apply -f zabbix-server.yaml
```
7 - Execute the apply to create frontend

```
 kubectl apply -f zabbix-frontend.yaml 
```

Execute the command to get informations about your enviromennt:

```
kubectl get deployment,svc,pods,pvc,ingress  -n monitoring

```

![Alt text](screenshot/kubernetes-zabbix.png?raw=true "Kubernetes-Zabbix")

## CADVISOR

The Cadvisor export the metrics of the Kubernetes if you preferer monitoring this environment with the Zabbix.

```
kubectl apply -f cadvisor.yaml
```

```
kubectl get deployment,svc,pods,pvc,ingress  -n cadvisor`
```
![Alt text](screenshot/cadvisor.png?raw=true "Cadvisor")


## Access

To  you access  Zabbix through the Minikube, execute this command:

```
$ minikube tunnel
Status:	
	machine: minikube
	pid: 4042
	route: 10.96.0.0/12 -> 172.17.0.2
	minikube: Running
	services: []
    errors: 

```

After that execute this command to get IP address of the Zabbix Frontend:

```
$ kubectl get svc  -n monitoring
...
zabbix-web-nginx-mysql   ClusterIP   10.103.89.223   <none>        8081/TCP,8443/TCP   18h

```

## Metrics

I created one host at the Zabbix to get metrics Cadvisor

![Alt text](screenshot/metrics-cadvisor-zabbix.png?raw=true "Cadvisor-Zabbix")


## Reference

https://www.zabbix.com/documentation/current/manual/config/items/itemtypes/prometheus

https://hub.docker.com/u/zabbix/

https://kubernetes.io/docs/concepts/


Thanks, @QuintilianoB for collaborating with the best practices Kubernetes  :)