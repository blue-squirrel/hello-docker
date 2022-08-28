#deploy.sh

docker build --platform linux/amd64 -t [1440054388/test1]:latest .
docker tag [1440054388/test1]:latest [1440054388/test1]
docker push [1440054388/test1]