#!/bin/sh
cp target/app.war app.war
docker build -t eldermoraes/app .

docker rm -f app1 || true
docker rm -f app2 || true
docker rm -f app3 || true
docker rm -f lbapp || true

docker run -d -p 8081:8080 --name app1 -h app1 eldermoraes/app 
docker run -d -p 8082:8080 --name app2 -h app2 eldermoraes/app 
docker run -d -p 8083:8080 --name app3 -h app3 eldermoraes/app 

docker run -d --name lbapp \
	-p 80:80 \
	--link app1:app1 \
	--link app2:app2 \
	--link app3:app3 \
	--env-file ./env.list \
	jasonwyatt/nginx-loadbalancer