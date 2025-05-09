docker cp es882:/usr/share/elasticsearch/config/certs/http_ca.crt /home/sifatul/work/sequesto/

curl --cacert /home/sifatul/work/sequesto/http_ca.crt -u elastic https://localhost:9200

docker run \
	--name kibana882 \
	--net elastic \
	-p 5601:5601 \
	--memory 1g \
	docker.elastic.co/kibana/kibana:8.8.2
