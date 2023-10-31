# Initialization for AWS EC2 Ubuntu 22.04 LTS
# bash server_init.sh

# Install VSFTPD
sudo apt-get update -y
sudo apt-get install -y vsftpd

# VSFTPD Settings & Restart Services
sudo sh -c 'echo "ubuntu" >> /etc/ftpusers'
sudo sed -i -e '122s/^#//' -e '123s/^#//' -e '125s/^#//' /etc/vsftpd.conf
sudo systemctl restart vsftpd

# Docker & Docker-Compose Install & Restart Services
curl -fsSL get.docker.com -o get-docker.sh && sh get-docker.sh
sudo usermod -aG docker ubuntu
sudo systemctl restart containerd
sudo systemctl restart docker.service
sudo apt install docker-compose -y

# Docker-Compose Up
sudo docker-compose -f docker-compose.monitoring.yml up -d --build
