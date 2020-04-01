# Run a container into a dedicated network
docker container run ubuntu --network=custom-isolated-network

# Create a custom network
docker network create--driver=bridge--subnet=182.18.0.0/16 custom-isolated-network

# Inspect container to retrieve the used network
docker container inspect container-id
# check inside Network item :
Networks: {
    bridge: {
        gateway: 172.17.0.1,
        IPAddress: 172.17.0.6,
        MacAddress: 02:42:ac:11:00:06
    }
}

# Create a new network named wp-mysql-network using the bridge driver.
#  Allocate subnet 182.18.0.1/24.
#  Configure Gateway 182.18.0.1
docker network create --driver=bridge --subnet=182.18.0.1/24 --gateway=182.18.0.1 wp-mysql-network

# Deploy a mysql database using the mysql image and name it mysql-db. Attach it to the newly created network wp-mysql-network
# Set the database password to use db_pass123. The environment variable to set is MYSQL_ROOT_PASSWORD
docker run --name=mysql-db -e MYSQL_ROOT_PASSWORD=db_pass123 --network=wp-mysql-network -d mysql

# Use private registry
docker login private-registry.io
docker run private-registry.io/apps/internal-app
docker push private-registry.io/my-

# Three type of network in docker
 bridge (default network) (ip range 172.17.0.x)
   docker run ubuntu
 none
   docker run ubuntu --network=none
 host
   docker run ubuntu --network=host
   can only expose one docker host port -> This port is only usable by one container

# Create an overlay network
docker network create --driver=overlay --subnet=10.0.9.0/24 my-overlay-network

# Attach a network to a service
docker service create --replicas=2 -network=my-overlay-network nginx

# Ingress network -> built-in load balancer
docker service create --replicas=2 -p 80:5000 my-web-server

# Embedded DNS
container name can be used as a dns inside docker system.
This is done via an embedded DNS which save inside table the name of the container and its ip address
docker run --name=web my-web-server
docker run --name=mysql mysql
----------------------
| Host  |     IP     |
----------------------
| web   | 172.17.0.2 |
----------------------
| mysql | 172.17.0.3 |
----------------------
