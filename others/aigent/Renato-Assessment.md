## Renato/Aigent Assessment

This is a small assessment to see how you work with these tools.

Please make a new project that can run inside minikube or kubernetes. (https://github.com/kubernetes/minikube)

Make a container run a webserver (nginx, apache, or your choice) with a custom `index.html` page, include a simple custom greeting like `Hello Aigent Team!` or something similar, extra fancy HTML is **not** required, just do something short and basic for the html page.
Additionally, run an extra container of postgres, with a container of `adminer` (see here: https://hub.docker.com/_/adminer/).

Ensure that when the project is deployed, someone could use `adminer` in their browser to access the postgres database.

Additionally, automatically create and populate a database with some dummy/test data, just a simple database with a minimal data set, it can just be one row of data, just to make it simple.

Also run a standalone minio deployment, see here (https://min.io/). 
Ensure all containers have an associated kubernetes service so that the URLs can be accessed in a browser, for example.

Include a simple and basic README file that briefly explains how to operate the project.
Package everything in a zip file, and send it in an email, i do not want to git clone the project.


Here are the same requirements in bullet form:

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
