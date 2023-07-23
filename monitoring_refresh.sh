# Description: Monitoring Refresh Script
cd backend
git pull
# Docker-Compose File Copy
cp ~/backend/docker-compose.monitoring.yml ~/
cd ~
# Docker-Compose Up
sudo docker-compose up -f docker-compose.monitoring.yml -d --build
