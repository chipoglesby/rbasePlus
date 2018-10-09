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
RUN curl -sSL https://sdk.cloud.google.com | bash
RUN Rscript -e "install.packages(c('readr','curl', 'httr', 'httpuv', 'bigrquery', 'searchConsoleR','googleAnalyticsR', 'dplyr','googleAuthR'), repos = 'http://cran.us.r-project.org')"
RUN rm -rf /tmp/downloaded_packages/ /tmp/*.rds
RUN rm -rf /var/lib/apt/lists/*