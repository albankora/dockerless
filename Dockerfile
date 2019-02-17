FROM node:8-alpine

RUN apk update \
    && apk add bash \
    && rm -rf /var/cache/apk/* \
    && npm install -g serverless@1.37.1 \
    && npm install -g serverless-offline@4.3.0

WORKDIR /app

COPY package*.json /app/
RUN npm install
