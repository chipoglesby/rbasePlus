FROM rocker/r-base:latest

# Installs needed Linux packages
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    python \
    curl \
    tar \
    libssl-dev \
    nano \
    git \
    apt-utils \
    libcurl4-openssl-dev \
    cron

# Installs The Google Cloud SDK
RUN curl -sSL https://sdk.cloud.google.com | bash

# Installs necessary R packages
RUN R -ess "install.packages(c('curl', 'httr', 'bigrquery', 'searchConsoleR','googleAnalyticsR', 'dplyr','googleAuthR'), repos = 'http://cran.us.r-project.org')"

# ENTRYPOINT ["sh", "-c"]