FROM ghcr.io/home-assistant/home-assistant:stable
# RUN wget -O - https://get.hacs.xyz | bash -
WORKDIR /config
CMD wget -O - https://get.hacs.xyz | bash - && /init
# ENTRYPOINT [ "/init" ]
