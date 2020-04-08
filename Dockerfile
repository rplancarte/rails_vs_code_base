FROM ruby:2.7-alpine

RUN apk add --update --virtual \
  runtime-deps \
  postgresql-client \
  build-base \
  libxml2-dev \
  libxslt-dev \
  nodejs \
  yarn \
  libffi-dev \
  readline \
  build-base \
  postgresql-dev \
  libc-dev \
  linux-headers \
  readline-dev \
  file \
  imagemagick \
  tzdata \
  git \
  openssh \
  && rm -rf /var/cache/apk/* 

WORKDIR /usr/src/app
COPY ./Gemfile ./Gemfile.lock ./
COPY ./.profile ./.irbrc ./.gitconfig /root/

ENV BUNDLE_PATH /gems
RUN bundle install
RUN yarn install --check-files

EXPOSE 3000
