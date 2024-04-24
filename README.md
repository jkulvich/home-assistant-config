# Home Assistant

## Create your own certs

```bash
openssl req -x509 -newkey rsa:2048 -keyout key.pem -out cert.pem -days 9999
openssl rsa -in key.pem -out key.pem
mkdir -p ./nginx/ssl
mv key.pem cert.pem ./nginx/ssl
chmod 600 ./nginx/ssl/key.pem ./nginx/ssl/cert.pem
```

## Install HACS

Run container:

```bash
sudo docker run -d \   
  --name homeassistant \
  --privileged \
  --restart=unless-stopped \
  -e TZ=MY_TIME_ZONE \
  -v ./home-assistant/config:/config \
  -v /run/dbus:/run/dbus:ro \
  --network=host \
  ghcr.io/home-assistant/home-assistant:stable
```

Connect to your container:

```bash
sudo docker exec -it "<container_id>" bash
```

Install HACS:

```bash
wget -O - https://get.hacs.xyz | bash -
```