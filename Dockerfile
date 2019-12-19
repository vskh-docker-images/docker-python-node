# Dockerfile for container with latest Python 3 and Node.js installed
FROM python:slim
LABEL "maintainer"="Vadym S. Khondar <vadym@khondar.name>"
LABEL "description"="Container with latest Python 3 and Node.js"

ARG RUN_PYTHON=1
ENV RUN_PYTHON=${RUN_PYTHON}

RUN apt update && \
    apt install -y curl git gnupg apt-utils && \
    curl -sL https://deb.nodesource.com/setup_13.x | /bin/bash - && \
    apt install -y nodejs build-essential default-libmysqlclient-dev && \
    pip install mysqlclient && \
    apt purge -y build-essential && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

CMD [ $RUN_PYTHON = 1 ] && python3 || node

# end

