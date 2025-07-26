ARG BUILD_FROM=node:18
FROM $BUILD_FROM

ENV LANG C.UTF-8

ARG BUILD_ARCH
ARG BUILD_DATE
ARG BUILD_REF
ARG BUILD_VERSION

LABEL \
    io.hass.name="flight-extractor" \
    io.hass.description="Flight data extractor" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION} \
    maintainer="KdoSiOdJinud" \
    org.label-schema.description="Flight data extractor" \
    org.label-schema.build-date=${BUILD_DATE} \
    org.label-schema.name="homeassistant-flight-extractor" \
    org.label-schema.schema-version="0.1.0" \
    org.label-schema.url="https://github.com/kdosiodjinud/homeassistant-addons/flight-extractor" \
    org.label-schema.usage="https://github.com/kdosiodjinud/homeassistant-addons/flight-extractor/README.md" \
    org.label-schema.vcs-ref=${BUILD_REF} \
    org.label-schema.vcs-url="https://github.com/kdosiodjinud/homeassistant-addons/flight-extractor" \
    org.label-schema.vendor="Community Hass.io Addons"

WORKDIR /usr/src/app

COPY package.json package-lock.json ./
RUN npm install --production \
    && npx playwright install --with-deps chromium

COPY server.js extract.js ./

EXPOSE 3000

CMD ["node", "server.js"]
