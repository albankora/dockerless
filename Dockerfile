FROM node:8-alpine

RUN apk update \
    && apk add bash \
    && npm install -g serverless@1.37.1 \
    && npm install -g serverless-offline@4.3.0

WORKDIR /app
