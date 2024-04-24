FROM ghcr.io/home-assistant/home-assistant:stable
WORKDIR /config
# RUN wget -O - https://get.hacs.xyz | bash -
# Install HACS
RUN mkdir /config/custom_components && \
    wget "https://github.com/hacs/integration/releases/latest/download/hacs.zip" -O /config/custom_components/hacs.zip && \
    unzip "/config/custom_components/hacs.zip" -d "/config/custom_components/hacs"
ENTRYPOINT [ "/init" ]

# FROM ghcr.io/home-assistant/home-assistant:stable
# WORKDIR /config
# CMD wget -O - https://get.hacs.xyz | bash - && /init
