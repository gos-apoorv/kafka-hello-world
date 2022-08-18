# Absolutely awesome: http://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.DEFAULT_GOAL := help

start-env: ## Start the docker compose
		docker-compose -f ./kafka-docker/docker-compose.yml up -d

stop-env: ## Stop the docker compose
		docker-compose -f ./kafka-docker/docker-compose.yml  down

restart-env: stop-env start-env## Restart the docker compose

scale-env: # Optional - Scale the cluster by adding more brokers (Will start a single zookeeper instance)
		docker-compose scale kafka=3

create-topic:
		docker exec -it kafka-docker_kafka_1 /bin/sh
		cd opt/kafka_2.13-2.8.1/bin
		kafka-topics.sh --create --zookeeper zookeeper:2181 --replication-factor 1 --partitions 1 --topic  first_kafka_topic
		kafka-topics.sh --list --zookeeper zookeeper:2181



