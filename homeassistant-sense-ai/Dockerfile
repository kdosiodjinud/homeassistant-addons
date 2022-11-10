FROM codeproject/ai-server

ENV LANG C.UTF-8

ARG BUILD_ARCH
ARG BUILD_DATE
ARG BUILD_REF
ARG BUILD_VERSION

LABEL \
    io.hass.name="homeassistant-sense-ai" \
    io.hass.description="Sense AI integration" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION} \
    maintainer="KdoSiOdJinud" \
    org.label-schema.description="Sense AI integration" \
    org.label-schema.build-date=${BUILD_DATE} \
    org.label-schema.name="homeassistant-sense-ai" \
    org.label-schema.schema-version="0.1" \
    org.label-schema.url="https://github.com/kdosiodjinud/homeassistant-agent-dvr/homeassistant-sense-ai" \
    org.label-schema.usage="https://github.com/kdosiodjinud/homeassistant-agent-dvr/homeassistant-sense-ai/README.md" \
    org.label-schema.vcs-ref=${BUILD_REF} \
    org.label-schema.vcs-url="https://github.com/kdosiodjinud/homeassistant-agent-dvr" \
    org.label-schema.vendor="Community Hass.io Addons"

WORKDIR /data

COPY run.sh /

RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
