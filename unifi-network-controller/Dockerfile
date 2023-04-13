ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8

ARG BUILD_ARCH
ARG BUILD_DATE
ARG BUILD_REF
ARG BUILD_VERSION

ENV BUILD_ARCH=${BUILD_ARCH}

LABEL \
    io.hass.name="unify-network-controller" \
    io.hass.description="UniFi Network Controller integration" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION} \
    maintainer="KdoSiOdJinud" \
    org.label-schema.description="UniFi Network Controller" \
    org.label-schema.build-date=${BUILD_DATE} \
    org.label-schema.name="unify-network-controller" \
    org.label-schema.schema-version="0.0.1" \
    org.label-schema.url="https://github.com/kdosiodjinud/homeassistant-addons/unify-network-controller" \
    org.label-schema.usage="https://github.com/kdosiodjinud/homeassistant-addons/unify-network-controller/README.md" \
    org.label-schema.vcs-ref=${BUILD_REF} \
    org.label-schema.vcs-url="https://github.com/kdosiodjinud/homeassistant-addons/unify-network-controller" \
    org.label-schema.vendor="KdoSiOdJinud Hass.io Addons"

RUN mkdir -p /unify-network-controller

WORKDIR /unify-network-controller

RUN apt-get update && \
    apt-get install \
        wget

#RUN wget https://dl.ui.com/unifi/7.3.83/unifi_sysvinit_all.deb
#RUN dpkg -i unifi_sysvinit_all.deb

COPY init.sh /
RUN chmod a+x /init.sh

CMD [ "/init.sh" ]
