#!/usr/bin/env bash
set -e

# check for wget
which wget > /dev/null || (apt update && apt install wget -y -qq)
# check for pgp
which gpg > /dev/null || (apt update && apt install gpg -y -qq)

wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/hashicorp.list

apt update && apt install packer