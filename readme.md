Wireguard Client Docker

The main Reason for this Docker is to bypass CGNat/DS-Lite see more: [here](https://github.com/NightMeer/Bypass-CGNAT)

Please download the [wg0.conf](https://raw.githubusercontent.com/NightMeer/WireguardClient-Docker/main/wg0.conf) edit the values and start the Docker
docker-compose.yml
```
services:
  wireguardclient:
    image: ghcr.io/nightmeer/wireguardclient:latest
    volumes:
      - ./wireguard/config:/config

```
Start Docker

```
docker run --restart unless-stopped --privileged -d -v /host/path/config:/config ghcr.io/nightmeer/wireguardclient:latest
```
