ARG RUBY_VERSION
FROM ruby:$RUBY_VERSION-alpine

ARG SOLARGRAPH_VERSION=$SOLARGRAPH_VERSION
ARG SOLARGRAPH_CORE_VERSION=$SOLARGRAPH_CORE_VERSION

RUN apk update &&\
  apk add --no-cache --virtual .build-deps gcc make musl-dev build-base libxml2-dev libxslt-dev &&\
  gem install solargraph --version $SOLARGRAPH_VERSION &&\
  solargraph download-core $SOLARGRAPH_CORE_VERSION

WORKDIR /app

EXPOSE 7658
