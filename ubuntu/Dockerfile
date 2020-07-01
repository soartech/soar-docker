FROM ubuntu

ENV SOAR_HOME /opt/soar/
ENV PATH "/opt/soar/:${PATH}"

COPY soar-ubuntu.tgz /opt/soar-ubuntu.tgz

ENV SOAR_HOME /opt/soar

RUN apt update \
    && apt install -y --no-install-recommends tcl \
    && mkdir -p /opt/soar \
    && cd /opt \
    && tar xzvf soar-ubuntu.tgz

WORKDIR /opt/soar
