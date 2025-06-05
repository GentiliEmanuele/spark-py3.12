FROM python:3.12-slim

USER root

RUN apt update && apt install -y default-jre 
RUN apt update && apt install -y curl
RUN curl -fSL https://dlcdn.apache.org/spark/spark-4.0.0/spark-4.0.0-bin-hadoop3.tgz -o spark.tgz && \
    tar -xzf spark.tgz -C /opt && \
    rm spark.tgz

ENV SPARK_VERSION=4.0.0
ENV HADOOP_VERSION=3
ENV SPARK_HOME=/opt/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}
ENV PATH=$SPARK_HOME/bin:$PATH
RUN pip install --no-cache-dir requests influxdb-client pyspark hdfs

ENV PYSPARK_PYTHON=python3
ENV PYSPARK_DRIVER_PYTHON=python3

