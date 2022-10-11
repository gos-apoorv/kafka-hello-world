import json
import random
import time
from datetime import datetime
from data_generator import generate_message
from kafka import KafkaProducer

# Serializing the message into JSON
def serializer(message):
    return json.dumps(message).encode('utf-8')

# Kafka Producer
producer = KafkaProducer(
    bootstrap_servers = ['localhost:9092'],
    value_serializer = serializer
)

if __name__ == '__main__':

    print("Starting producer...")

    # Loop
    while True:
        #Generate message
        test_message = generate_message()

        # Send it to Kafka topic
        print(f'Producing Message @ {datetime.now()} | message = {str(test_message)}')
        producer.send('message', test_message)

        # Sleep for random seconds
        time_to_sleep = random.randint(1,11)
        time.sleep(time_to_sleep)
