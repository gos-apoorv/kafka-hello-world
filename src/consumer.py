import json
from kafka import KafkaConsumer

if __name__ == '__main__':

    # consumer
    consumer = KafkaConsumer(
        'message',
        bootstrap_servers = ['localhost:9092'],
        auto_offset_reset = 'earliest'
    )

    print("Starting consumer...")

    for message in consumer:
        print(json.load(message.value))