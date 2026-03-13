# Dockerfile for container with latest Python 3 and Node.js installed
FROM python:slim
LABEL "maintainer"="Vadym S. Khondar <vadym@khondar.name>"
LABEL "description"="Container with latest Python 3 and Node.js"

ARG RUN_PYTHON=1
ENV RUN_PYTHON=${RUN_PYTHON}

RUN apt update && \
    apt install -y curl git gnupg apt-utils && \
    curl -sL https://deb.nodesource.com/setup_25.x | /bin/bash - && \
    apt install -y nodejs build-essential pkg-config default-libmysqlclient-dev && \
    pip install mysqlclient && \
    apt purge -y build-essential && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

# end

