FROM kdosiodjinud/ispyagentdvr:0.0.2

ENV LANG C.UTF-8

ARG BUILD_ARCH
ARG BUILD_DATE
ARG BUILD_REF
ARG BUILD_VERSION

LABEL \
    io.hass.name="agent-dvr" \
    io.hass.description="Agent DVR integration" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION} \
    maintainer="KdoSiOdJinud" \
    org.label-schema.description="Agent DVR integration" \
    org.label-schema.build-date=${BUILD_DATE} \
    org.label-schema.name="homeassistant-agent-dvr" \
    org.label-schema.schema-version="16.7" \
    org.label-schema.url="https://github.com/kdosiodjinud/homeassistant-addons/agent-dvr" \
    org.label-schema.usage="https://github.com/kdosiodjinud/homeassistant-addons/agent-dvr/README.md" \
    org.label-schema.vcs-ref=${BUILD_REF} \
    org.label-schema.vcs-url="https://github.com/kdosiodjinud/homeassistant-addons/agent-dvr" \
    org.label-schema.vendor="Community Hass.io Addons"

WORKDIR /data

RUN apt-get update && apt-get install -y libvlc-dev vlc libx11-dev

COPY build.sh /
RUN chmod a+x /build.sh

CMD ["/build.sh"]
