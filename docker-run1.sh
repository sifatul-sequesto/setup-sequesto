# This is where we'll store all the onlyoffice data so make sure it's a valid dir path
sequesto_data_dir="/Users/sifatul/work/sequesto" # update this according to your need

mkdir -p \
    "$sequesto_data_dir/onlyoffice/DocumentServer/logs" \
    "$sequesto_data_dir/onlyoffice/DocumentServer/data" \
    "$sequesto_data_dir/onlyoffice/DocumentServer/lib" \
    "$sequesto_data_dir/onlyoffice/DocumentServer/db" \
    "$sequesto_data_dir/onlyoffice/DocumentServer/sdkjs-plugins" \
    "$sequesto_data_dir/onlyoffice/DocumentServer/fonts"

docker run -t -d \
    -p 3003:80 \
    -e JWT_ENABLED=false \
    --name sequesto-onlyoffice \
    --restart=always \
    --memory 2g \
    -v "$sequesto_data_dir/onlyoffice/DocumentServer/logs:/var/log/onlyoffice" \
    -v "$sequesto_data_dir/onlyoffice/DocumentServer/data:/var/www/onlyoffice/Data" \
    -v "$sequesto_data_dir/onlyoffice/DocumentServer/lib:/var/lib/onlyoffice" \
    -v "$sequesto_data_dir/onlyoffice/DocumentServer/db:/var/lib/postgresql" \
    -v "$sequesto_data_dir/onlyoffice/DocumentServer/sdkjs-plugins:/var/www/onlyoffice/documentserver/sdkjs-plugins" \
    -v "$sequesto_data_dir/onlyoffice/DocumentServer/fonts:/usr/share/fonts/truetype/custom" \
    onlyoffice/documentserver-de:latest

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
