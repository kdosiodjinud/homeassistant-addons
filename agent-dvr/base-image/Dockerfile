FROM ubuntu:24.04

ARG TZ=Europe/Prague
ARG LIBVA_VERSION=v2.22-branch

ENV DEBIAN_FRONTEND=noninteractive \
    TZ=${TZ} \
    MALLOC_TRIM_THRESHOLD_=100000 \
    DEFAULT_DOWNLOAD_API="https://www.ispyconnect.com/api/Agent/DownloadLocation4?platform=Linux64&fromVersion=0"

# Instalace základních balíčků a build-deps pro libva
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
      xz-utils \
      build-essential \
      meson \
      ninja-build \
      git \
      pkg-config \
      libdrm-dev && \
    rm -rf /var/lib/apt/lists/*

# Nastavení časové zóny
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

WORKDIR /agent

# Kompilace libva verze ≥2.21.0
RUN set -eux; \
    git clone --depth 1 --branch ${LIBVA_VERSION} https://github.com/intel/libva.git /tmp/libva; \
    cd /tmp/libva; \
    meson setup build; \
    ninja -C build; \
    ninja -C build install; \
    ldconfig; \
    cd /; \
    rm -rf /tmp/libva; \
    # Vyčištění build-nástrojů (volitelné)
    apt-get purge -y --auto-remove build-essential meson ninja-build git pkg-config libdrm-dev; \
    rm -rf /var/lib/apt/lists/*

# Stažení a rozbalení Agenta DVR + ffmpeg7
RUN set -eux; \
    URL=$(wget -qO- "${DEFAULT_DOWNLOAD_API}" | tr -d '"'); \
    echo "Downloading Agent from: ${URL}"; \
    wget -O agent.zip "${URL}"; \
    unzip agent.zip -d /agent; \
    rm agent.zip; \
    wget https://ispyrtcdata.blob.core.windows.net/downloads/ffmpeg7-linuxx64.tar.xz -O ffmpeg.tar.xz; \
    mkdir ffmpeg7; \
    tar -xJf ffmpeg.tar.xz -C ffmpeg7; \
    rm ffmpeg.tar.xz; \
    chmod +x /agent/Agent || true; \
    chmod +x /agent/agent-register.sh || true; \
    chmod +x /agent/agent-reset.sh || true; \
    chmod +x /agent/agent-reset-local-login.sh || true;

EXPOSE 8090
EXPOSE 3478/tcp
EXPOSE 3478/udp
EXPOSE 50000-50100/udp

CMD ["/agent/Agent"]
