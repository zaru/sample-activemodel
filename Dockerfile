FROM ruby:2.5.1
ENV LANG C.UTF-8

RUN apt-get update && \
    apt-get install -y nodejs mysql-client --no-install-recommends && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY Gemfile /usr/src/app/
COPY Gemfile.lock /usr/src/app/
RUN bundle install

COPY . /usr/src/app

EXPOSE 3000
