# This Dockerfile will build a lightweight docker
# environment containing Soar at /opt/soar.

FROM alpine:3.11

COPY soar-alpine.tgz /opt/soar-alpine.tgz

ENV SOAR_HOME /opt/soar

RUN apk add --no-cache libstdc++ tcl \
    && mkdir -p /opt/soar \
    && cd /opt \
    && tar xzvf soar-alpine.tgz \
    && echo "export PATH=/opt/soar:${PATH}" >> /etc/profile

WORKDIR /opt/soar

ENTRYPOINT [ "/bin/sh", "-l" ]
