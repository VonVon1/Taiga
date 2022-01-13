#  Aplicação Taiga em Docker.

Este repositório contém o serviço de open source,chamado taiga criado em [ Docker ](https://www.docker.com/).

##  Informações e dúvidas sobre o projeto oficial

http://taiga.io/

##  Comandos

docker-compose up -d subir a stack do compose,após isso:
./start-taiga.sh
executar o script para a criação de superusuário.

## Variáveis de Ambiente do Compose

Ao alterar as variáveis,modificar elas em seus determinados campos dos serviços na stack.

## Conteiners 

gateway:nginx , banco:postgresql , mensagens:RABBITMQ , back e front: Java e python.
OBS: importante trocar as informações do domínio do taiga para o IP do servidor que irá usar.

## Verificando se o stack está saúdavel:

Após a execução da stack - docker container ls ou docker ps para ver se está tudo em pé,se sim acesse a aplicação
pelo endereço http://meudomínio.com:9000 e logue com o superusuário para configurar o resto das particularidades.

## Possíveis causas se um ou mais container da stack não subir:

Endereço do domínio:TAIGA_SITES_DOMAIN:"seu-domínio:9000"(,versão da imagem(docker image ls),comandos da stack do compose na ordem errada,se vc estiver utilizando o Docker Desktop em Windows pode ser que a stack não suba por conta de particularidades do Docker Desktop.Após entender algumas das possíveis causas do problema entrar em cada container através do docker exec -ti (nome-da-imagem) bash e ver se cada container está saúdavel e funcionando normalmente.Vale ressaltar que se você mudar uma ou mais variáveis do compose elas deverão ser mudadas em cada serviço da stack por exemplo o usuário do POSTGRES_USER: Maria essa variável deverá ser a mesma em cada serviço que utilize ela,toda a stack está umsando a network: taiga,se mudar o nome da network deverá também ser mudada em cada serviço para o acesso corretamente com a rede do Docker,atenção a ordem das dependências do container pois alguns dependem de outros para subir como por exemplo o taiga-back: depends_on : taiga-db , taiga-events-rabbitmq , taiga-async-rabbitmq.

## Configurações

**Serviço: taiga-db**
```
POSTGRES_DB: (SEU BANCO)
POSTGRES_USER: (SEU USUARIO)
POSTGRES_PASSWORD: (SUA SENHA)
```
OBS: deverá ser o mesmo no serviço: taiga-back e pode ser configurado em taiga-back.
Porta: 5432

A configuração padrão assume que o Taiga está sendo servido em um **subdomínio** :
```
TAIGA_SECRET_KEY: "taiga-back-secret-key"
TAIGA_SITES_SCHEME: "http"
TAIGA_SITES_DOMAIN: "meudomínio.com:9000"
TAIGA_SUBPATH: ""
```
**Serviço: taiga-front**

```
TAIGA_URL: "http://meudomínio.com"
TAIGA_WEBSOCKETS_URL: "ws://meudomínio.com"
TAIGA_SUBPATH: "/"
```
**Serviço: taiga-events**
```
TAIGA_SECRET_KEY: taiga-back-secret-key
```
**Serviço: taiga-protected**
```
SECRET_KEY: "taiga-back-secret-key"
```
###  Configurações do RABBITMQ

Essas variáveis são usadas para deixar mensagens nos serviços rabbitmq. Essas variáveis devem ser as mesmas que em `taiga-back` , `taiga-async` , `taiga-events` , `taiga-async-rabbitmq` e `taiga-events-rabbitmq` 

**Serviço: taiga-back**
```
RABBITMQ_USER: (SEU USUARIO)
RABBITMQ_PASS: (SUA SENHA)
```
**Serviço: taiga-async-rabbitmq**
```
RABBITMQ_ERLANG_COOKIE: secret-erlang-cookie
RABBITMQ_DEFAULT_USER: (SEU USUARIO)
RABBITMQ_DEFAULT_PASS: (SUA SENHA)
RABBITMQ_DEFAULT_VHOST: taiga
```

**Serviço: taiga-events-rabbitmq**
```
RABBITMQ_ERLANG_COOKIE: secret-erlang-cookie
RABBITMQ_DEFAULT_USER: (SEU USUARIO)
RABBITMQ_DEFAULT_PASS: (SUA SENHA)
RABBITMQ_DEFAULT_VHOST: taiga
```


