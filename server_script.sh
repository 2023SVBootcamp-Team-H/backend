# Back-End Script
# AWS 기준

# Install VSFTPD
sudo apt-get update -y
sudo apt-get install -y vsftpd

# VSFTPD Settings & Restart Services
sudo sh -c 'echo "ubuntu" >> /etc/ftpusers'
sudo sed -i -e '122s/^#//' -e '123s/^#//' -e '125s/^#//' /etc/vsftpd.conf
sudo systemctl restart vsftpd

# Will be changed
# cd backend/data/python
# docker build -t api .
# cd ~
# cd backend/data/board
# docker build -t board .
# cd ~

# Docker & Docker-Compose Install & Restart Services
sudo apt install docker -y
sudo apt install docker-compose -y
sudo usermod -aG docker ubuntu
sudo systemctl restart containerd
sudo systemctl restart docker.service

# Docker-Compose File Copy
cp ~/backend/docker-compose.yml ~/

# Docker-Compose
sudo docker-compose up -d

echo EveryThing is Done.
