# Use Ubuntu LTS
FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=C.UTF-8
ENV TZ=Europe/Prague
ENV PLAYWRIGHT_BROWSERS_PATH=0

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
    org.label-schema.schema-version="0.1.22" \
    org.label-schema.url="https://github.com/kdosiodjinud/homeassistant-addons/flight-extractor" \
    org.label-schema.usage="https://github.com/kdosiodjinud/homeassistant-addons/flight-extractor/README.md" \
    org.label-schema.vcs-ref=${BUILD_REF} \
    org.label-schema.vcs-url="https://github.com/kdosiodjinud/homeassistant-addons/flight-extractor" \
    org.label-schema.vendor="Community Hass.io Addons"

# Install system dependencies required for Playwright
RUN apt-get update && apt-get install -y \
    curl \
    ca-certificates \
    fonts-liberation \
    libnss3 \
    libatk-bridge2.0-0 \
    libxss1 \
    libasound2 \
    libxshmfence1 \
    libgbm1 \
    libgtk-3-0 \
    libdrm2 \
    git \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Install Node.js LTS
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get install -y nodejs && \
    npm install -g npm

WORKDIR /usr/src/app

COPY package.json package-lock.json ./
RUN npm ci --omit=dev

RUN npx playwright install --with-deps

COPY . .

EXPOSE 3000
CMD ["node", "server.js"]
