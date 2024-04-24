#!/bin/bash

# This script follows official Home Assistant instructions:
# https://community.home-assistant.io/t/reverse-proxy-using-nginx/196954

# Check if SSL doesn't exists
if [ ! -f ./nginx/ssl/cert.pem ] || [ ! -f ./nginx/ssl/key.pem ]; then
    echo "SSL doesn't exists, generating..."
    # Check for OpenSSL installation
    if ! [ -x "$(command -v openssl)" ]; then
        echo 'Error: OpenSSL is not installed.' >&2
        exit 1
    fi
    openssl req -x509 -newkey rsa:2048 -keyout key.pem -out cert.pem -days 9999
    openssl rsa -in key.pem -out key.pem
    mkdir -p ./nginx/ssl
    mv key.pem cert.pem ./nginx/ssl
    chmod 600 ./nginx/ssl/key.pem ./nginx/ssl/cert.pem
fi

# Check is dhparams doesn't exists
if [ ! -f ./nginx/ssl/dhparams.pem ]; then
    echo "dhparams doesn't exists, generating..."
    # Check for OpenSSL installation
    if ! [ -x "$(command -v openssl)" ]; then
        echo 'Error: OpenSSL is not installed.' >&2
        exit 1
    fi
    openssl dhparam -out ./nginx/ssl/dhparams.pem 2048
fi

# Check for Docker installation
if ! [ -x "$(command -v docker)" ]; then
    echo 'Error: Docker is not installed.' >&2
    exit 1
fi

echo "Starting up ..."
docker compose -f compose.yaml up #-d
