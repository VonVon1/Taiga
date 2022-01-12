#  Aplicação Taiga em Docker.

Este repositório contém o serviço de open source,chamado taiga criado em [ Docker ](https://www.docker.com/).

##  Informações e dúvidas sobre o projeto oficial

http://taiga.io/

##  Comandos

docker-compose up -d subir a stack do compose,após isso:
./start-taiga.sh
executar o script para a criação de superusuário.

## Variváveis de Ambiente do Compose

Ao alterar as variáveis,modificar elas em seus determinados campos dos serviços na stack.

## Conteiners 

gateway:nginx , banco:postgresql , mensagens:RABBITMQ , back e front: Java e python.

## Informações de como implementar no seu domínio no arquivo:

production.txt

