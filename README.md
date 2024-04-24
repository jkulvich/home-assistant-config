# Home Assistant

## Create your own certs

```bash
openssl req -x509 -newkey rsa:2048 -keyout key.pem -out cert.pem -days 9999
openssl rsa -in key.pem -out key.pem
mkdir -p ./nginx/ssl
mv key.pem cert.pem ./nginx/ssl
chmod 600 ./nginx/ssl/key.pem ./nginx/ssl/cert.pem
```
