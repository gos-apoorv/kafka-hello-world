# Kafka Hello World
A sample repo to test kafka in docker-desktop

## Pre-Requisites
- [Docker](https://www.docker.com/get-started/#h_installation)
- [Docker-Compose](https://docs.docker.com/compose/install/)

## Create Topic
To create topic 
```shell
## Create the kafka topic in interactive mode
cd opt/kafka_2.13-2.8.1/bin
kafka-topics.sh --create --zookeeper zookeeper:2181 --replication-factor 1 --partitions 1 --topic  message
kafka-topics.sh --list --zookeeper zookeeper:2181
exit
```

## Producer
To push message follow these steps.
```shell
docker exec -it  kafka /bin/sh
cd opt/kafka_2.13-2.8.1/bin
kafka-console-producer.sh --broker-list kafka:9092 --topic message
> {'user_id': 23, 'message':'Test Messge'}
```

## Consumer
To consume message follow these steps.
```shell
docker exec -it  kafka /bin/sh
cd opt/kafka_2.13-2.8.1/bin
kafka-console-consumer.sh --bootstrap-server kafka:9092 --topic message [--from-beginning]
```

## References
- [Medium.com: hello-kafka-world-the-complete-guide-to-kafka-with-docker-and-python](https://medium.com/big-data-engineering/hello-kafka-world-the-complete-guide-to-kafka-with-docker-and-python-f788e2588cfc)
- [Install Kafka easy way](https://betterdatascience.com/how-to-install-apache-kafka-using-docker-the-easy-way/)
- [Youtube.com:How to Install Kafka Using Docker - Write Your First Kafka Topic ](https://www.youtube.com/watch?v=4xFZ_iTZLTs)
- [Youtube.com: Apache Kafka From the Shell - How Producers and Consumers Work](https://www.youtube.com/watch?v=FlAlz8guJeM)
- [Youtube.com:Write Kafka Consumers and Producers in Python ](https://www.youtube.com/watch?v=LHNtL4zDBuk)
