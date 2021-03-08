# vi pkg/docker/entrypoint.sh /entrypoint.sh
# login into oc first
oc delete dc vxm-pgadmin45
sleep 60
CONTAINER=`docker images | grep pgadmin4| awk '{print $3}'|sort -u`
echo $CONTAINER
docker rmi $CONTAINER --force
make docker > make_docker_out.txt
docker tag pgadmin4:latest nosnow111/vxm-pgadmin45:latest
docker push nosnow111/vxm-pgadmin45:latest
oc apply -f ../vxm-pgadmin45.yaml


