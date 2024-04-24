FROM ghcr.io/home-assistant/home-assistant:stable
WORKDIR /config
RUN wget -O - https://get.hacs.xyz | bash -
# CMD wget -O - https://get.hacs.xyz | bash - && /init
ENTRYPOINT [ "/init" ]
