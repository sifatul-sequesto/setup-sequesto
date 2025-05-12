# This is where we'll store all the onlyoffice data so make sure it's a valid dir path
sequesto_data_dir="/Users/sifatul/work/sequesto" # update this according to your need

docker cp es882:/usr/share/elasticsearch/config/certs/http_ca.crt "$sequesto_data_dir/"

curl --cacert "$sequesto_data_dir/http_ca.crt" -u elastic https://localhost:9200

docker run \
    --name kibana882 \
    --net elastic \
    -p 5601:5601 \
    --memory 1g \
    docker.elastic.co/kibana/kibana:8.8.2
