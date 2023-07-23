# Deploy for AWS EC2 Ubuntu 22.04 LTS

# bash server_refresh.sh

cd backend
git pull

cd data/django_project
git pull

cd ~
cd frontend
git pull
npm install
npm run build
cd ~

cp -r ~/frontend/dist ~/backend/data/nginx/html
cp ~/backend/docker-compose.prod.yml ~/

sudo docker-compose down -f docker-compose.prod.yml
sudo docker-compose up -f docker-compose.prod.yml -d --build