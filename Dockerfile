FROM rocker/r-base:latest

# Installs needed Linux packages
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    python \
    curl \
    tar \
    libssl1.1/testing \
    libssl-dev \
    nano \
    git \
    apt-utils \
    libcurl4-openssl-dev \
    cron
