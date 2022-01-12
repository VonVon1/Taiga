# script para a criação do superusuário
# OBS: Não deve ser executado antes de executar o comando docker-compose up -d,o serviço precisa estar em pé para a criação do mesmo.
#
set -x
exec docker-compose -f docker-compose.yml -f docker-compose-inits.yml run --rm taiga-manage createsuperuser$@
