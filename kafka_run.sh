KAFKA_RELEASE="3.7.0"
KAFKA_SCALA_VERSION="2.13"

# Check if Kafka exists
if [ ! -d ".kafka" ]; then
    echo "Downloading and installing Kafka"
    mkdir ".kafka"
    curl -SL https://archive.apache.org/dist/kafka/$KAFKA_RELEASE/kafka_$KAFKA_SCALA_VERSION-$KAFKA_RELEASE.tgz | tar -xzf - -C ".kafka" --strip-components=1
fi

rm -rf /tmp/zookeeper
rm -rf /tmp/kafka-logs
rm -rf /tmp/kafka-streams

./.kafka/bin/zookeeper-server-start.sh ./.kafka/config/zookeeper.properties &
PID_ZOOKEEPER=$!
sleep 1
./.kafka/bin/kafka-server-start.sh ./.kafka/config/server.properties        &
PID_KAFKA=$!

cleanup() {
    echo "Stopping Kafka..."
    ./.kafka/bin/zookeeper-server-stop.sh   &
    ./.kafka/bin/kafka-server-stop.sh       &
    wait
}

# Trap the INT signal (Ctrl+C) and call the cleanup function
trap cleanup INT

wait
