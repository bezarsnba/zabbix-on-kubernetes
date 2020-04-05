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
kubectl apply -f zabbix-agent-deployment.yaml
```

6- Execute the apply to create zabbix-server

```
 kubectl apply -f zabbix-server-deployment.yaml
```
7 - Execute the apply to create frontend

```
 kubectl apply -f zabbix-frontend.yaml 
```

Execute the command to get informations about your enviromennt
```
kubectl get deployment,svc,pods,pvc,ingress  -n monitoring
```

## CADVISOR

The Cadvisor export the metrics of the Kubernetes if you preferer monitoring this environment with the Zabbix.

```
kubectl apply -f cadvisor.yaml
```

```
kubectl get deployment,svc,pods,pvc,ingress  -n cadvisor
```

