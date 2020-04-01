# To limit cpu usage by the container
docker run -cpu=0.5 ubuntu

# To limit the memory usage by the container
docker run --memory=100m ubuntu

# File System
/var/lib/docker
  -> aufs
  -> containers
  -> image
  -> volumes
  -> networks

# Volume
# To create a docker volume
docker create volume data_volume
The volume is created under /var/lib/docker/volumes/data_volume

# Mount a created docker volume in a container -> Volume mounting
docker run -v data_volume:/var/lib/mysql mysql

# In case of the volume is not created while running a container
#  -> docker will automatically create a volume
docker run -v data_volume2:/var/lib/mysql mysql
A volume is created under /var/lib/docker/volumes/data_volume2

# To run a container and use an specific directory to mount it in the container -> Bind mounting
docker run -v /data/mysql:/var/lib/mysql mysql

# Deprecated usage
docker run -v

# New way to mount a volume
docker run --mount type=bind,source=/data/mysql,target=/var/lib/mysql mysql
docker run --mount type=volume,source=data_volume,target=/var/lib/mysql mysql

# Storage driver
-> AUFS
-> ZFS
-> BTRFS
-> Device Mapper
-> Overlay
-> Overlay2

# To see a history of docker image
docker history image_id
