if [ "$#" -ne 1 ]; then
    echo "Please specify a topic!"
fi

./.kafka/bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic $1 --from-beginning
