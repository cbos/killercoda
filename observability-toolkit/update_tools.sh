#!/bin/sh

set -euf
# shellcheck disable=SC3040
(set -o pipefail 2> /dev/null) && set -o pipefail

echo ">> Preparing the environment"
echo ">> Install docker-compose and just"


# Prepare docker compose
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

ARCH="$(dpkg --print-architecture)"
VERSION_CODENAME="$(source /etc/os-release && echo "${VERSION_CODENAME}")"
readonly ARCH VERSION_CODENAME

printf 'deb [arch=%s signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu %s stable' "${ARCH}" "${VERSION_CODENAME}" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Prepare K6
sudo gpg -k
sudo gpg --no-default-keyring --keyring /usr/share/keyrings/k6-archive-keyring.gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys C5AD17C747E3415A3642D57D77C6C491D6AC1D69
echo "deb [signed-by=/usr/share/keyrings/k6-archive-keyring.gpg] https://dl.k6.io/deb stable main" | sudo tee /etc/apt/sources.list.d/k6.list

# Update packages and install them
sudo apt-get update
sudo apt-get install -y docker-compose-plugin just k6 && clear && echo "Setup complete with docker compose, just and k6. Environment is ready to use."
