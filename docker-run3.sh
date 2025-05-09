docker run -t -d \
	--name elasticmq \
	--net elastic \
	-p 9324:9324 \
	--memory 256m \
	softwaremill/elasticmq
