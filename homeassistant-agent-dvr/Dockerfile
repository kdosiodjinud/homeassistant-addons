FROM kdosiodjinud/homeassistant-agent-dvr:amd64_1.0.15

ENV LANG C.UTF-8

ARG BUILD_ARCH
ARG BUILD_DATE
ARG BUILD_REF
ARG BUILD_VERSION

LABEL \
    io.hass.name="homeassistant-agent-dvr" \
    io.hass.description="Agent DVR integration" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION} \
    maintainer="KdoSiOdJinud" \
    org.label-schema.description="Agent DVR integration" \
    org.label-schema.build-date=${BUILD_DATE} \
    org.label-schema.name="homeassistant-agent-dvr" \
    org.label-schema.schema-version="6.7" \
    org.label-schema.url="https://github.com/kdosiodjinud/homeassistant-agent-dvr/homeassistant-agent-dvr" \
    org.label-schema.usage="https://github.com/kdosiodjinud/homeassistant-agent-dvr/homeassistant-agent-dvr/README.md" \
    org.label-schema.vcs-ref=${BUILD_REF} \
    org.label-schema.vcs-url="https://github.com/kdosiodjinud/homeassistant-agent-dvr" \
    org.label-schema.vendor="Community Hass.io Addons"

WORKDIR /data

#RUN chmod a+x /links.sh && /links.sh

COPY run.sh /

RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
