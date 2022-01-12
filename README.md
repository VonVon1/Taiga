#  Alicação Taiga em Docker.

Este repositório contém o serviço de open source,chamado taiga criado o [ Docker ](https://www.docker.com/).

##  Informações e dúvidas sobre o projeto oficial

http://taiga.io/

##  Comandos

docker-compose up -d subir a stack do compose,após isso:
./start-taiga.sh
executar o script para a criação de superusuário.

## Variváveis de Ambiente do Compose

Ao alterar as variáveis lembrando que elas devem ser as mesmas em todos os serviços do stack.

## Conteiners 

gateway:nginx , banco:postgresql , mensagens:RABBITMQ , back e front: Java e python.

## Informações de como implementar no seu dominío no arquivo:

production.txt
