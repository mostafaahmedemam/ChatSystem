FROM ruby:3.3.3

WORKDIR /usr/src/app

ENV REDIS_URL="redis://redis:6379"
COPY . .
RUN bundle install
