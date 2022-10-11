# Absolutely awesome: http://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.DEFAULT_GOAL := help

start-env: ## Start the docker compose
		docker-compose -f docker-compose.yml up -d

stop-env: ## Stop the docker compose
		docker-compose  down

restart-env: stop-env start-env## Restart the docker compose

scale-env: # Optional - Scale the cluster by adding more brokers (Will start a single zookeeper instance)
		docker-compose scale kafka=3

start-shell: ## Start the kafka shell in interactive mode
		docker exec -it kafka /bin/sh

create-topic: ## Create the kafka topic
		docker exec kafka /bin/sh /opt/kafka_2.13-2.8.1/bin/kafka-topics.sh --create --zookeeper zookeeper:2181 --replication-factor 1 --partitions 1 --topic  message

list-topic: ## List the kafka topics
		docker exec kafka /bin/sh /opt/kafka_2.13-2.8.1/bin/kafka-topics.sh --list --zookeeper zookeeper:2181

describe-topic: ## Descrive the kafka topic
		docker exec kafka /bin/sh /opt/kafka_2.13-2.8.1/bin/kafka-topics.sh --describe --zookeeper zookeeper:2181 --topic  message

delete-topic: ## Delete the kafka topic
		docker exec kafka /bin/sh /opt/kafka_2.13-2.8.1/bin/kafka-topics.sh --delete --zookeeper zookeeper:2181 --topic  message

create-env: ## Create the virtual environment
		virtualenv -p python3 ktest

activate-env: ## Activate the virtual environment
		source ktest/bin/activate

install-py-kafka: ## Install Python Kafka library
		python3 -m pip install kafka-python
