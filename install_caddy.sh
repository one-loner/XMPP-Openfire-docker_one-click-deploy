#!/bin/bash
if (($EUID !=0)); then
     echo Script must be run by root.
     exit
fi

read -p "Please enter your domain name: " d

cp Caddyfile Caddyfile.default

sed -i "s/yourdomain.com/$d/g" Caddyfile

apt install -y debian-keyring debian-archive-keyring apt-transport-https curl gpg

curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | gpg --dearmor -o /usr/share/keyrings/caddy-stable-archive-keyring.gpg

curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' | tee /etc/apt/sources.list.d/caddy-stable.list

apt update

sudo apt install -y caddy

cp /etc/caddy/Caddyfile /etc/caddy/Caddyfile.backup

cat Caddyfile > /etc/caddy/Caddyfile

echo "Done. Visit $d to setup your XMPP server."
