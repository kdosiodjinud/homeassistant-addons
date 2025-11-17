FROM ubuntu:24.04

ARG TZ=Europe/Prague

ENV DEBIAN_FRONTEND=noninteractive \
    TZ=${TZ} \
    MALLOC_TRIM_THRESHOLD_=100000 \
    DEFAULT_DOWNLOAD_API="https://www.ispyconnect.com/api/Agent/DownloadLocation4?platform=Linux64&fromVersion=0"

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      ca-certificates \
      wget \
      unzip \
      curl \
      ffmpeg \
      libgdiplus \
      tzdata \
      alsa-utils \
      libvlc-dev \
      vlc \
      libx11-dev \
      xz-utils && \
    rm -rf /var/lib/apt/lists/*

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

WORKDIR /agent

RUN set -eux; \
    URL=$(wget -qO- "${DEFAULT_DOWNLOAD_API}" | tr -d '"'); \
    echo "Downloading Agent from: ${URL}"; \
    wget -O agent.zip "${URL}"; \
    unzip agent.zip -d /agent; \
    rm agent.zip; \
    wget https://ispyrtcdata.blob.core.windows.net/downloads/ffmpeg7-linuxx64.tar.xz -O ffmpeg.tar.xz; \
    chmod 777 ffmpeg.tar.xz; \
    chmod +x /agent/Agent || true; \
    chmod +x /agent/agent-register.sh || true; \
    chmod +x /agent/agent-reset.sh || true; \
    chmod +x /agent/agent-reset-local-login.sh || true; \
    chmod +x /agent/setup-ffmpeg-linux.sh || true; \
    mkdir ffmpeg7; \
    ./setup-ffmpeg-linux.sh ffmpeg7/ ; \
    rm ffmpeg.tar.xz;

EXPOSE 8090
EXPOSE 3478/tcp
EXPOSE 3478/udp
EXPOSE 50000-50100/udp

# Volumes
# VOLUME ["/agent/Media/XML", "/agent/Media/WebServerRoot/Media", "/agent/Commands"]

CMD ["/agent/Agent"]
