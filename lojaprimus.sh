#!/bin/bash
# cria uma rede para a comunicação dos containers.
docker network create loja-primus-net

# launch mysql 5.7 container
docker run -ti --name loja-primus-dbsrv \
	--network loja-primus-net \
	-e MYSQL_ROOT_PASSWORD=lojaprimus \
	-dp 3307:3306 mysql:5.7

# launch prestashop container
docker run -ti --name loja-primus \
	--network loja-primus-net \
	-e DB_SERVER=loja-primus-dbsrv \
	-dp 8080:80 prestashop/prestashop:latest

