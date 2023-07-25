# Description: Monitoring Refresh Script
cd backend
git pull
# Docker-Compose File Copy
cp ~/backend/docker-compose.monitoring.yml ~/
cd ~
# Docker-Compose Up
sudo docker-compose -f docker-compose.monitoring.yml up  -d --build
