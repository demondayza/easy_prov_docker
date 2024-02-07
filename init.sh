#!/usr/bin/expect -f

#Install Docker and Docker-compose
git clone https://gitlab.com/bmcgonag/docker_installs.git
cd docker_installs
sudo chmod +x install_docker_nproxyman.sh
sudo ./install_docker_nproxyman.sh
# Set timeout to prevent hanging in case of unexpected prompts
set timeout 20

# Start the installation script
spawn ./install.sh

# Expect the OS selection prompt and choose Ubuntu 22.04
expect "Please select the number for your OS / distro: "
send "4\r"

# Automate responses for Docker-CE, Docker-Compose, and skip others
expect "Docker-CE (y/n):"
send "y\r"
expect "Docker-Compose (y/n):"
send "y\r"
expect "NGinX Proxy Manager (y/n):"
send "n\r"
expect "Navidrome (y/n):"
send "n\r"
expect "Portainer-CE (y/n):"
send "n\r"
expect "Remotely - Remote Desktop Support (y/n):"
send "n\r"
expect "Guacamole - Remote Desktop Protocol in the Browser (y/n):"
send "n\r"

# Handle the Portainer-CE or Agent selection if needed
# This part might need adjustment based on the specific logic of your script.
# For example, if you chose to install Portainer-CE:
# expect "Please choose either Portainer-CE or just Portainer Agent:"
# send "1\r"

# Expect end of script or any final messages
expect eof

#Install Lazydocker
LAZYDOCKER_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazydocker/releases/latest" | grep -Po '"tag_name": "v\K[0-9.]+')
curl -Lo lazydocker.tar.gz "https://github.com/jesseduffield/lazydocker/releases/latest/download/lazydocker_${LAZYDOCKER_VERSION}_Linux_x86_64.tar.gz"
mkdir lazydocker-temp
tar xf lazydocker.tar.gz -C lazydocker-temp
sudo mv lazydocker-temp/lazydocker /usr/local/bin
lazydocker --version
rm -rf lazydocker.tar.gz lazydocker-temp


