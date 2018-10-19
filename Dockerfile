FROM rocker/r-base:latest

RUN apt-get update \
  && apt-get install -y --allow-downgrades --no-install-recommends \
  apt-utils \
  python3.6 \
  libpython3.6-minimal \
  libpython3.6-stdlib

RUN apt-get install -y --allow-downgrades --no-install-recommends \
  cron \
  curl \
  git \
  nano \
  python \
  tar \
  libssl1.1/testing \
  libssl-dev \
  libcurl4-openssl-dev \
  && curl -sSL https://sdk.cloud.google.com | bash \
  && Rscript -e "install.packages(c('readr','curl', 'httr', 'httpuv', 'bigrquery', 'searchConsoleR','googleAnalyticsR', 'dplyr','googleAuthR'), repos = 'http://cran.us.r-project.org')" \
  && rm -rf /tmp/downloaded_packages/ /tmp/*.rds \
  && rm -rf /var/lib/apt/lists/*

ENV PATH $PATH:/root/google-cloud-sdk/bin
