BASE_IMAGE = freefeed/base:latest

all: init

init: image freefeed-server freefeed-react-client
	make -C freefeed-server init
	make -C freefeed-react-client init

freefeed-server:
	@git clone -b dockerizing git@github.com:FreeFeed/freefeed-server.git

freefeed-react-client:
	@git clone -b dockerizing git@github.com:FreeFeed/freefeed-react-client.git

run:
	docker-compose up

image:
	@docker build -t $(BASE_IMAGE) .

clean:
	docker-compose down
	@make -C freefeed-server clean
	@make -C freefeed-react-client clean
	docker rmi $(BASE_IMAGE)
	docker volume rm freefeed_dbdata

.PHONY: all init run image clean
