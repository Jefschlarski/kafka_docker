# Define a imagem padrão do container
FROM confluentinc/cp-kafka:7.5.0

# Copia o script create_topic.sh para o contêiner do broker
COPY /kafka/utils/create_topic.sh /etc/confluent/docker/create_topic.sh

# Torne o script de inicialização executável
USER root
RUN chmod +x /etc/confluent/docker/create_topic.sh

# Expoem a porta do broker
EXPOSE $PORTS_BROKER

# Executa o script create_topic.sh
ENTRYPOINT ["/etc/confluent/docker/create_topic.sh"]