// todo

docker buildx build --platform linux/arm/v7 -t kdosiodjinud/homeassistant-agent-dvr:1.0.0 . --no-cache

COPY install.sh ./install.sh
RUN chmod a+x ./install.sh && ./install.sh
