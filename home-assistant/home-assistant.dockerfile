# FROM ghcr.io/home-assistant/home-assistant:stable
# WORKDIR /
# RUN wget -O - https://get.hacs.xyz | bash -
# WORKDIR /config
# ENTRYPOINT [ "/init" ]

FROM ghcr.io/home-assistant/home-assistant:stable
RUN echo '' > '/config/.HA_VERSION'
RUN bash -c 'declare -r haPath=/config; wget -O - https://get.hacs.xyz | bash -'
WORKDIR /config
ENTRYPOINT [ "/init" ]

# FROM ghcr.io/home-assistant/home-assistant:stable
# WORKDIR /config
# # Install HACS
# RUN mkdir /config/custom_components && \
#     wget "https://github.com/hacs/integration/releases/latest/download/hacs.zip" -O /config/custom_components/hacs.zip && \
#     unzip "/config/custom_components/hacs.zip" -d "/config/custom_components/hacs"
# ENTRYPOINT [ "/init" ]

# FROM ghcr.io/home-assistant/home-assistant:stable
# WORKDIR /config
# CMD wget -O - https://get.hacs.xyz | bash - && /init
