FROM maven:alpine
MAINTAINER Swire Chen <idoop@msn.cn>

ENV VERSION=1.1.0 \
    PORTAL_PORT=8170

ADD apollo-adminservice-${VERSION}-github.zip /apollo-adminservice-${VERSION}-github.zip
ADD apollo-configservice-${VERSION}-github.zip /apollo-configservice-${VERSION}-github.zip
ADD apollo-portal-${VERSION}-github.zip /apollo-portal-${VERSION}-github.zip

COPY docker-entrypoint /usr/local/bin/docker-entrypoint
COPY healthcheck.sh    /usr/local/bin/healthcheck.sh

RUN mkdir /apollo-admin/dev /apollo-admin/fat /apollo-admin/uat /apollo-admin/pro /apollo-config/dev /apollo-config/fat /apollo-config/uat /apollo-config/pro /apollo-portal -p && \
    chmod +x /usr/local/bin/docker-entrypoint /usr/local/bin/healthcheck.sh

HEALTHCHECK --interval=5m --timeout=3s CMD bash /usr/local/bin/healthcheck.sh

EXPOSE 8170 8180 8181 8182 8183 8190 8191 8192 8193

ENTRYPOINT ["docker-entrypoint"]
