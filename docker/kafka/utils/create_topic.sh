#!/bin/bash

# Inicia o kafka com um topico inicial

# Inicia o serviço Kafka
/etc/confluent/docker/run &

# Espera o serviço Kafka estar pronto para executar create topic
cub kafka-ready -b $BROKER_HOST 1 20

# Crie o tópico padrão (substitua o nome e as configurações no arquivo create_topic.env no diretorio /docker/environment)
kafka-topics --create --topic $TOPIC_NAME --partitions $PARTITIONS --replication-factor $REPLICATION --bootstrap-server $BROKER_HOST

# Mantenha o contêiner em execução
tail -f /dev/null