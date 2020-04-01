# Create nginx service
docker service create --name=nginx-container nginx

# To publish a port on running cluster
docker service update nginx-container --publish-add 5000:80

# To create a service with replicas
docker service create --name=nginx-container --replica=2 nginx

# To list services
docker service ls

# To get running process
docker service ps ngnix-container