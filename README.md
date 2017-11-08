# Docker-ATS-Positiats
For building a Docker image for ATS-Positiats

Please follow the following steps to build and push:

docker build -f Dockerfile ./
docker images -a
docker tag [IMAGE] dockerhwxi/ats2:[VERSION]
docker push dockerhwxi/ats2:[VERSION]
