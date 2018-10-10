FROM rocker/r-base:latest

# Installs needed Linux packages
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
  libssl-dev
    
ENTRYPOINT ["/bin/bash"]
