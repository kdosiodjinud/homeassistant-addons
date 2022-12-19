ARG BUILD_FROM
FROM ${BUILD_FROM}

ARG BUILD_ARCH
ARG BUILD_DATE
ARG BUILD_REF
ARG BUILD_VERSION

LABEL \
    io.hass.name="evolveo-detective-d04" \
    io.hass.description="Camera actions subscriber add-on" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION} \
    maintainer="KdoSiOdJinud" \
    org.label-schema.description="Home Assistant camera actions subscriber add-on" \
    org.label-schema.build-date=${BUILD_DATE} \
    org.label-schema.name="evolveo-detective-d04" \
    org.label-schema.schema-version="1.1" \
    org.label-schema.url="https://github.com/kdosiodjinud/evolveo-detective-d04/evolveo-detective-d04" \
    org.label-schema.usage="https://github.com/kdosiodjinud/evolveo-detective-d04/evolveo-detective-d04/README.md" \
    org.label-schema.vcs-ref=${BUILD_REF} \
    org.label-schema.vcs-url="https://github.com/kdosiodjinud/evolveo-detective-d04" \
    org.label-schema.vendor="Community Hass.io Addons"

ENV LANG C.UTF-8

RUN apk update && \
    apk add -y --no-cache mosquitto-clients jq

WORKDIR /data

COPY run.sh /

RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
