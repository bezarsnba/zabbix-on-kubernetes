
# README

This document will show you how to put the requirement working on kubernetes as requested bellow:

- Produce kubernetes YAML manifest file(s), Dockerfiles, and/or shell script(s)
- Ensure it can run inside Minikube or Kubernetes (you can use this: https://github.com/kubernetes/minikube)
- Run a webserver with a simple custom HTML page, fancy HTML is not required
- Run a postgres database instance
- Populate a postgres database with a small custom dataset, any sort of data
- Run an adminer instance (https://hub.docker.com/_/adminer/)
- Run a standalone minio deployment (https://min.io/)
- Ensure I can visit the URL of minio, adminer, and the webserver in my browser
- Include a short/brief README file that explains what to do with the project (maybe i need to build a dockerfile?)
- Put everything in a ZIP file, email me the zip or a web link to the zip file. (devops@aigent.com)

>***Note***: 
>
>***I decided to use minikube to run kubernetes locally.***
>***I faced some problems with the ingress version, regarding redirects from HTTP to HTTPS using an Invalid certificate, to avoid extra time lose, I decide to exposed the services directly with **NodePort**.***

## Deploying the environment
I created some YAML files to do the deployment, additionally, I created an image that is on dockerhub (https://hub.docker.com/repository/docker/zenatuz/nginx-aigent), the DOCKER file used to create the image can be found on ***aigent-image*** directory. 

That image was created with the command:
>***docker build -t nginx-aigent:0.0.1 aigent-image***

Inside the directory YAMLs,  you'll find one file for each system.
~~~
.
├── adminer.yml
├── minio.yml
├── namespace.yml
├── nginx.yml
└── postgres.yml
~~~

The script ***startup.sh*** will start the minikube with the command: ***minikube start***, after that it will start the deployment process. 

This script will configure and deploy on kubernetes at the following order:
1 - namespace
2 - nginx
3 - postgres
4 - adminer
5 - minio

After deploy all the pieces on the kubernetes, it will be necessary manually import the  ***sample-database*** on Postgres

> Note: I should use **init Containers** (https://kubernetes.io/docs/concepts/workloads/pods/init-containers/) to populate the database, but as I'm already late to delivery it, this can be done later.


After finishes the deploy process, the script will get the public IP of the minikube VM and print the URLs.

**Example**:
The Public IP of MINIKUBE is: 192.168.39.45

Use the following URLs to access the systems inside kubernetes:
- Nginx: http://192.168.39.45:31283
- Postgres: 192.168.39.45:31132
- Adminer: http://192.168.39.45:30525
- Minio: http://192.168.39.45:30900

## Specifics about the deployment

### Nginx
For this case, I used a tiny container with alpine + nginx + static html file.

### Postgres
To assure the data to persist, I used the **local volume** as PV to the database.

> **Database connection data:**
> - POSTGRES_DB: **database**
> - POSTGRES_USER: **admin**
> - POSTGRES_PASSWORD: **admin123**

### Adminer
Adminer don't require any extra config. However, it's necessary to connect using the IP:PORT provided on the script.

### Minio
Minio also require a volume to persist data, again I used **local volume** as PV to the MINIO.

> **MINIO Login data:**
> - MINIO_ACCESS_KEY: **minio**
>  - MINIO_SECRET_KEY: **minio123**