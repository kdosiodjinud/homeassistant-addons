FROM ghcr.io/hassio-addons/debian-base/amd64:d33377b
#FROM ghcr.io/hassio-addons/debian-base/armv7:5.2.2

COPY createUser.sh ./createUser.sh
COPY tools.sh ./tools.sh
COPY openCv.sh ./openCv.sh
COPY agentDVR.sh ./agentDVR.sh
COPY dotNet.sh ./dotNet.sh
COPY links.sh ./links.sh

RUN chmod a+x ./createUser.sh && ./createUser.sh
RUN chmod a+x ./tools.sh && ./tools.sh
RUN chmod a+x ./openCv.sh && ./openCV.sh
RUN chmod a+x ./agentDVR.sh && ./agentDVR.sh
RUN chmod a+x ./dotNet.sh && ./dotNet.sh
RUN chmod a+x ./links.sh && ./links.sh
