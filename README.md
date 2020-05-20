## Introduction

- In this repository contains files necessary to provisioning Zabbix in Kubernetes

# Pre requirements

- Kubernetes (Used version: v1.18.0)

# File structure

| File			| Content | Resources |
| ------------- | ------- | --------- |
| [cadvisor.yaml](./cadvisor.yaml) | Configuration to get and export monitoring metrics of [cAdvisor](https://prometheus.io/docs/guides/cadvisor/) ||
| [clusterRole-monitoring.yaml](./clusterRole-monitoring.yaml) | Prometheus roles ||
| [confimaps.yaml](./confimaps.yaml) | Non confidential variables with data used in many files | [ConfigMaps](https://kubernetes.io/docs/concepts/configuration/configmap/)
| [nampespace.yaml](./nampespace.yaml) | Namespace configuration |[Namespaces](https://kubernetes.io/docs/concepts/overview/working-with-objects/namespaces/)|
| [zabbix-agent.yaml](zabbix-agent.yaml) | Configuration of Zabbix Agent | [Statefulsets](https://kubernetes.io/docs/concepts/workloads/controllers/statefulset/), [PVC and PV](https://kubernetes.io/docs/concepts/storage/persistent-volumes/) |
| [database-mysql.yaml](./database-mysql.yaml) |Database configuration | [Statefulsets](https://kubernetes.io/docs/concepts/workloads/controllers/statefulset/), [PVC and PV](https://kubernetes.io/docs/concepts/storage/persistent-volumes/), [Service](https://kubernetes.io/docs/concepts/services-networking/service/), [StorageClass](https://kubernetes.io/docs/concepts/storage/storage-classes/) |
| [zabbix-server.yaml](./zabbix-server.yaml) | Zabbix server configuration | [Statefulsets](https://kubernetes.io/docs/concepts/workloads/controllers/statefulset/) and [Service](https://kubernetes.io/docs/concepts/services-networking/service/) |
| [zabbix-frontend.yaml](./zabbix-frontend.yaml) | Frontend configuration | [Statefulsets](https://kubernetes.io/docs/concepts/workloads/controllers/statefulset/) and [Service](https://kubernetes.io/docs/concepts/services-networking/service/) |


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
