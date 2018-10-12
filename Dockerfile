FROM maven:alpine
MAINTAINER Swire Chen <idoop@msn.cn>

ENV VERSION=1.1.0 \
    PORTAL_PORT=8070

ADD apollo-adminservice-${VERSION}-github.zip /apollo-adminservice-${VERSION}-github.zip
ADD apollo-configservice-${VERSION}-github.zip /apollo-configservice-${VERSION}-github.zip
ADD apollo-portal-${VERSION}-github.zip /apollo-portal-${VERSION}-github.zip
RUN mkdir /apollo-admin/dev /apollo-admin/fat /apollo-admin/uat /apollo-admin/pro /apollo-config/dev /apollo-config/fat /apollo-config/uat /apollo-config/pro /apollo-portal -p

COPY docker-entrypoint /usr/local/bin/docker-entrypoint
RUN chmod +x           /usr/local/bin/docker-entrypoint

EXPOSE 8070 8080 8081 8082 8083 8090 8091 8092 8093

ENTRYPOINT ["docker-entrypoint"]
