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
    cron \
    && curl -sSL https://sdk.cloud.google.com | bash \
    && Rscript -e "install.packages(c('curl', 'httr', 'bigrquery', 'searchConsoleR','googleAnalyticsR', 'dplyr','googleAuthR'), repos = 'http://cran.us.r-project.org')" \
    && rm -rf /tmp/downloaded_packages/ /tmp/*.rds \
    && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/bin/bash"]
