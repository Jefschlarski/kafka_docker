

# KAFKA&CONTROL_CENTER

Container docker com kafka e control_center




## Configurações


Para executar o container, deve-se primeiramente configurar os arquivos .env conforme for necessario.

Na pasta [docker](/docker) temos primeiramente o arquivo [.env ](/docker/.env) responsavel por configurar as variaveis externas necessarias para o docker-compose.yml funcionar corretamente.

E na pasta [environment](/docker/environment) estão os demais arquivos de configuração, dos quais são: 

* [broker.env](/docker/environment/broker.env) : Responsavel pelas variaveis internas do container Broker;

* [control_center.env](/docker/environment/control_center.env): Responsavel pelas variaveis internas do container Control Center;

* [create_topic.env](/docker/environment/create_topic.env): Variaveis internas necessarias para criar o topico inicial do broker;


## Executando o Container
Na pasta [docker](/docker) abra o terminal e execute o comando abaixo:

```bash
  docker compose up -d
```

Após iniciado o broker kafka estara sendo executado no endereço definido na variavel `BROKER_HOST`, por padrão será o `localhost:9092` que pode ser alterado a qualquer momento no arquivo [broker.env](/docker/environment/broker.env).

O Control_Center estara rodando no localhost com a variavel `PORT` definida no arquivo [control_center.env](/docker/environment/control_center.env) e por padrão será a porta `9021`, para acessar o Control_Center basta acessar o endereço `localhost:9021` no navegador.


## Testando

### Para produzir mensagens kafka pode-se usar os comandos abaixo no terminal.

Acessando o container:
```bash
  docker exec -it broker bash
```
Iniciando o producer:
```bash
  kafka-console-producer --topic ${TOPIC_NAME} --bootstrap-server ${BROKER_HOST}
```

#### lembrando que as variaveis usadas nos comandos são providas pelos arquivos .env presentes na pasta [environment](/docker/environment).

Com o producer ativo basta escrever as mensagens no terminal e apertar `enter` para enviar.



### Para consumir mensagens kafka pode-se usar os comandos abaixo no terminal.

Acessando o container:
```bash
  docker exec -it broker bash
```
Acessando o container:
```bash
  kafka-console-consumer --topic ${TOPIC_NAME} --bootstrap-server ${BROKER_HOST} --from-beginning
```

#### lembrando que as variaveis usadas nos comandos são providas pelos arquivos .env presentes na pasta [environment](/docker/environment).


Com o producer ativo, todas as mensagens produzidas serão exibidas no terminal.


## Criar Topicos

Os topicos podem ser criados manualmente acessando o control_center ou utilizando comandos no terminal.

### Criando topicos pelo control_center

Basta acessar a plataforma do Control Center pelo endereço `localhost:9021` e acessar o `CLUSTER`ir na seção `TOPICS` e clicar em `ADD TOPIC`

### Criando topicos pelo terminal

Para criar topicos por linha de comando basta executar os comandos abaixo:

Acessando o container:
```bash
  docker exec -it broker bash
```
Acessando o container:
```bash
  kafka-topics --create --topic NOMEDOTOPICO --partitions 1 --replication-factor 1 --bootstrap-server $BROKER_HOST
```
#### lembrando que as variaveis `--topic` `--partitions` `--replication-factor` `--bootstrap-server` podem ser alteradas conforme necessario.