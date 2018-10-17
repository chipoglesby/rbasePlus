FROM rocker/r-base:latest

RUN apt-get update \
  && apt-get install -y --allow-downgrades --no-install-recommends \
  apt-utils \
  python \
  curl \
  tar \
  libpython3.6-minimal \
  libpython3.6-stdlib \
  libssl1.1/testing \
  libssl-dev \
  nano \
  git \
  libcurl4-openssl-dev \
  cron \
  && curl -sSL https://sdk.cloud.google.com | bash \
  && Rscript -e "install.packages(c('readr','curl', 'httr', 'httpuv', 'bigrquery', 'searchConsoleR','googleAnalyticsR', 'dplyr','googleAuthR'), repos = 'http://cran.us.r-project.org')" \
  && rm -rf /tmp/downloaded_packages/ /tmp/*.rds \
  && rm -rf /var/lib/apt/lists/* \
  && apt-get upgrade -y \
  && apt autoremove -y

ENV PATH $PATH:/root/google-cloud-sdk/bin
