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

## Informações de como implementar no seu domínio e checkar se a aplicação está saúdavel:

Após a execução da stack - docker container ls ou docker ps para ver se está tudo em pé,se sim acesse a aplicação
pelo endereço http://SEU-DOMÍNIO:9000 e logue com o superusuário para configurar o resto das particularidades.

## Possíveis causas se um ou mais container da stack não subir:

Endereço do domínio:TAIGA_SITES_DOMAIN:"seu-domínio:9000"(,versão da imagem(docker image ls),comandos da stack do compose na ordem errada,se vc estiver utilizando o Docker Desktop em Windows pode ser que a stack não suba por conta de particularidades do Docker Desktop.Após entender algumas das possíveis causas do problema entrar em cada container através do docker exec -ti (nome-da-imagem) bash e ver se cada container está saúdavel e funcionando normalmente.Vale ressaltar que se você mudar uma ou mais variáveis do compose elas deverão ser mudadas em cada serviço da stack por exemplo o usuário do POSTGRES_USER: Maria essa variável deverá ser a mesma em cada serviço que utilize ela,toda a stack está umsando a network: taiga,se mudar o nome da network deverá também ser mudada em cada serviço para o acesso corretamente com a rede do Docker,atenção a ordem das dependências do container pois alguns dependem de outros para subir como por exemplo o taiga-back: depends_on : taiga-db , taiga-events-rabbitmq , taiga-async-rabbitmq.
