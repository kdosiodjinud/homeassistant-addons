FROM doitandbedone/ispyagentdvr:vlc-support

ENV LANG C.UTF-8

ARG BUILD_ARCH
ARG BUILD_DATE
ARG BUILD_REF
ARG BUILD_VERSION

ENTRYPOINT []
CMD []
USER 0
WORKDIR /

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
    org.label-schema.schema-version="14.1" \
    org.label-schema.url="https://github.com/kdosiodjinud/homeassistant-agent-dvr/homeassistant-agent-dvr" \
    org.label-schema.usage="https://github.com/kdosiodjinud/homeassistant-agent-dvr/homeassistant-agent-dvr/README.md" \
    org.label-schema.vcs-ref=${BUILD_REF} \
    org.label-schema.vcs-url="https://github.com/kdosiodjinud/homeassistant-agent-dvr" \
    org.label-schema.vendor="Community Hass.io Addons"

WORKDIR /data

COPY build.sh /
RUN chmod a+x /build.sh
RUN /build.sh

CMD ["/agent/Agent"]
