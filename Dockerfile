FROM rocker/r-base:latest

RUN apt-get update \
  && apt-get install -y --allow-downgrades --no-install-recommends \
  apt-utils \
  python \
  curl \
  tar \
  libssl1.1/testing \
  libssl-dev \
  nano \
  git \
  libcurl4-openssl-dev \
  cron \
  && apt-get autoremove -y \
  && curl -sSL https://sdk.cloud.google.com | bash
