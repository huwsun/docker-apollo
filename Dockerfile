FROM maven:alpine
MAINTAINER huwsun <huwsun@gmail.com>

ENV VERSION=1.6.1 \
    PORTAL_PORT=8170

#ADD apollo-adminservice-${VERSION}-github.zip /apollo-adminservice-${VERSION}-github.zip
#ADD apollo-configservice-${VERSION}-github.zip /apollo-configservice-${VERSION}-github.zip
#ADD apollo-portal-${VERSION}-github.zip /apollo-portal-${VERSION}-github.zip

COPY docker-entrypoint /usr/local/bin/docker-entrypoint
COPY healthcheck    /usr/local/bin/healthcheck

RUN wget https://github.com/ctripcorp/apollo/releases/download/v${VERSION}/apollo-adminservice-${VERSION}-github.zip && \
    wget https://github.com/ctripcorp/apollo/releases/download/v${VERSION}/apollo-configservice-${VERSION}-github.zip && \
    wget https://github.com/ctripcorp/apollo/releases/download/v${VERSION}/apollo-portal-${VERSION}-github.zip && \
    mkdir /apollo-admin/dev /apollo-admin/fat /apollo-admin/uat /apollo-admin/pro /apollo-config/dev /apollo-config/fat /apollo-config/uat /apollo-config/pro /apollo-portal -p && \
    chmod +x /usr/local/bin/docker-entrypoint /usr/local/bin/healthcheck

HEALTHCHECK --interval=5m --timeout=3s CMD bash /usr/local/bin/healthcheck

ENTRYPOINT ["docker-entrypoint"]
