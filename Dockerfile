FROM node:8.11.4-stretch

RUN apt-get update && apt-get install -y graphicsmagick build-essential
