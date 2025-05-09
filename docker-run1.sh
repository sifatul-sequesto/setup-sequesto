mkdir -p /home/sifatul/work/sequesto/onlyoffice
mkdir -p /home/sifatul/work/sequesto/onlyoffice/DocumentServer
mkdir -p /home/sifatul/work/sequesto/onlyoffice/DocumentServer/logs
mkdir -p /home/sifatul/work/sequesto/onlyoffice/DocumentServer/data
mkdir -p /home/sifatul/work/sequesto/onlyoffice/DocumentServer/lib
mkdir -p /home/sifatul/work/sequesto/onlyoffice/DocumentServer/db
mkdir -p /home/sifatul/work/sequesto/onlyoffice/DocumentServer/sdkjs
mkdir -p /home/sifatul/work/sequesto/onlyoffice/DocumentServer/fonts

docker run -t -d \
	-p 3003:80 \
	-e JWT_ENABLED=false \
	--name sequesto-onlyoffice \
	--restart=always \
	--memory 2g \
	onlyoffice/documentserver-de:latest \
	--volume=/home/sifatul/work/sequesto/onlyoffice/DocumentServer/logs:/var/log/onlyoffice \
	--volume=/home/sifatul/work/sequesto/onlyoffice/DocumentServer/data:/var/www/onlyoffice/Data \
	--volume=/home/sifatul/work/sequesto/onlyoffice/DocumentServer/lib:/var/lib/onlyoffice \
	--volume=/home/sifatul/work/sequesto/onlyoffice/DocumentServer/db:/var/lib/postgresql \
	--volume=/home/sifatul/work/sequesto/onlyoffice/DocumentServer/sdkjs-plugins:/var/www/onlyoffice/documentserver/sdkjs-plugins \
	--volume=/home/sifatul/work/sequesto/onlyoffice/DocumentServer/fonts:/usr/share/fonts/truetype/custom

docker network create elastic
docker pull docker.elastic.co/elasticsearch/elasticsearch:8.8.2
docker pull docker.elastic.co/kibana/kibana:8.8.2

docker run -t \
	--name es882 \
	--net elastic \
	-p 9200:9200 \
	-p 9300:9300 \
	-e "discovery.type=single-node" \
	--memory 4g \
	docker.elastic.co/elasticsearch/elasticsearch:8.8.2
