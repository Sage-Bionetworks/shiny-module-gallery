# Based on https://raw.githubusercontent.com/Sage-Bionetworks/kubernetes-deployments/3429364a8b6be8733d2b25e1e19f8107f014bfaf/shiny/example_shiny/Dockerfile
FROM rocker/r-base:latest
LABEL maintainer="Andrew.Lamb@sagebase.org"
RUN apt-get update && apt-get install -y --no-install-recommends \
    sudo \
    libcurl4-gnutls-dev \
    libcairo2-dev \
    libxt-dev \
    libssl-dev \
    libssh2-1-dev \
    libxml2-dev \
    && rm -rf /var/lib/apt/lists/*

# add app and code
WORKDIR /home/app
COPY server.R ui.R renv.lock ./
COPY R ./R
COPY inst ./inst

# set up r packages via renv
RUN  R -e 'install.packages("renv")' \
     && R -e 'renv::restore()'

# set up python venv
RUN apt-get update && apt-get install -y --no-install-recommends \
    pip \
    python3-venv \
    && python3 -m venv virtual_env \
    && chmod 755 virtual_env \
    && . virtual_env/bin/activate \
    && pip3 install synapseclient



RUN addgroup --system app \
    && adduser --system --ingroup app app

RUN echo "local(options(shiny.port = 3838, shiny.host = '0.0.0.0'))" > /usr/lib/R/etc/Rprofile.site
RUN chown app:app -R /home/app
USER app
EXPOSE 3838
CMD ["R", "-e", "shiny::runApp('/home/app')"]
