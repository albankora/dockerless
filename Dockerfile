FROM node:8.10-alpine

RUN rm -rf /var/cache/apk/*

WORKDIR /app

COPY package*.json /app/
