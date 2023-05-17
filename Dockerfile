FROM openjdk:8-jre-alpine

# Install dependencies
RUN apk --no-cache add wget

# Download and extract Kafka binaries
ENV KAFKA_VERSION=3.2.3
ENV SCALA_VERSION=2.13
RUN wget https://downloads.apache.org/kafka/${KAFKA_VERSION}/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz && \
    tar -xzf kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz -C /opt && \
    rm kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz

# Set Kafka home directory
ENV KAFKA_HOME /opt/kafka_${SCALA_VERSION}-${KAFKA_VERSION}

# Download Avro producer
RUN wget https://repo1.maven.org/maven2/io/confluent/kafka-avro-console-producer/${KAFKA_VERSION}/kafka-avro-console-producer-${KAFKA_VERSION}.jar && \
    mv kafka-avro-console-producer-${KAFKA_VERSION}.jar $KAFKA_HOME/libs/
