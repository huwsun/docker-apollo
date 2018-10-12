FROM openjdk:8-jre-alpine
MAINTAINER Swire Chen <idoop@msn.cn>

ENV VERSION=1.1.0 \
    PORTAL_PORT=8070

RUN wget https://github.com/ctripcorp/apollo/releases/download/v${VERSION}/apollo-configservice-${VERSION}-github.zip && \
    wget https://github.com/ctripcorp/apollo/releases/download/v${VERSION}/apollo-adminservice-${VERSION}-github.zip && \
    wget https://github.com/ctripcorp/apollo/releases/download/v${VERSION}/apollo-portal-${VERSION}-github.zip && \
    mkdir /apollo-admin/dev /apollo-admin/fat /apollo-admin/uat /apollo-admin/pro /apollo-config/dev /apollo-config/fat /apollo-config/uat /apollo-config/pro /apollo-portal -p

COPY docker-entrypoint /usr/local/bin/docker-entrypoint
RUN chmod +x           /usr/local/bin/docker-entrypoint

EXPOSE 8070 8080 8081 8082 8083 8090 8091 8092 8093
# EXPOSE 80-60000

ENTRYPOINT ["docker-entrypoint"]
