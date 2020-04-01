# Run redis container
docker run -d --name=redis redis

# Run postgres container
docker run -d --name=db postgres:9.4

# Run vote-app container
docker run -d --name=vote -p 5000:80 --link redis:redis voting-app

# Run result container
docker run -d --name=result -p 5001:80 --link db:db result-app

# Run worker container
docker run -d --name=worker --link redis:redis --link db:db worker

# When adding a --links
# Docker will create an entry on /etc/hosts with the given link host with it IP address


# To build a compose stack
docker-compose up
