all : up

up : 
	@docker compose -f ./srcs/docker-compose.yml up -d

down : 
	@docker compose -f ./srcs/docker-compose.yml down

stop : 
	@docker compose -f ./srcs/docker-compose.yml stop

start : 
	@docker compose -f ./srcs/docker-compose.yml start
build :
	@docker compose -f ./srcs/docker-compose.yml build

status : 
	@docker ps
clean :
	@docker container prune --force
	@docker image prune --force
	@docker volume prune --force
	@rm -rf /home/mlatifi/data/wp/*
	@rm -rf /home/mlatifi/data/db/*

