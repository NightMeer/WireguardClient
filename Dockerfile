FROM ubuntu:22.04

ARG SOFTWARENAME_VER="1.0.0"

LABEL base.image="ubuntu:22.04"
LABEL dockerfile.version="1"
LABEL software="SoftwareName"
LABEL software.version="${SOFTWARENAME_VER}"
LABEL description="Wireguard Docker to Bypass CG-Nat"
LABEL website="https://github.com/NightMeer/WireguardClient"
LABEL license=""
LABEL maintainer="NightMeer"
LABEL maintainer.email="git@nightmeer.de"
#Github Related
LABEL org.opencontainers.image.source="https://github.com/NightMeer/WireguardClient" 

VOLUME ["/config"]

RUN apt-get update && apt-get upgrade -y  \
    && apt install -y iproute2 wireguard openresolv wireguard-dkms curl iptables

COPY ./startup.sh /startup.sh
RUN chmod 777 /startup.sh

ENTRYPOINT ["/bin/sh"]
CMD ["-c","/startup.sh"]
