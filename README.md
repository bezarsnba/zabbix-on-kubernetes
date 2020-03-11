## Introdução

- Neste repositorio contém arquivos necessários para subir o Zabbix no Kubernetes pelo Minikube.
- O Zabbix irá monitorar o Kubernetes atraves dos exportes do Cadvisor.

# Pre requisito

- Minikube
- Kubernetes

# Estruturação dos arquivos

- cadvisor.yaml - Configuração para monitorar as metricas/ Para o Zabbix
- clusterRole-monitoring.yaml - Roles do prometheus
- confimaps.yaml - variaveis 
- nampespace.yaml - namespace
- prometheus*.yaml - setup do prometheus.yaml
- zabbix-agent-deployment.yaml - Yaml para subir o agente(Deployment/Service/PVC)
- zabbix-db-mysql.yaml - Yaml para provisionar o banco de dados(Deployment/StorageClass/PV/PVC/Service)
- zabbix-server-deployment.yaml - Yaml para provisionar o server(StatefulSet/Service)
- zabbix-webnginx-deployment.yaml - Yaml para provisionar o web(StatefulSet/Service)


# Procedimento

Para applicar os Yamls basta executar:

```
kubectl apply -f <nome do arquivo>
```