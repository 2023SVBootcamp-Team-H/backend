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

# Django Project Clone
cd ~
sudo rm -rf backend/data/django_project
mkdir -p backend/data/django_project
cd backend/data/django_project
git clone git@github.com:2023SVBootcamp-Team-H/backend_test.git .
cd ~

# Install Node.js LTS Version
echo Visit https://nodejs.org/en/download/ and get the link to the nodejs tarball
echo enter the link here. Can skip this Through Enter
read url
if [ -z "$url" ]; then
    echo Skipping the node.js installation

else
    fname=$(echo $url | awk -F'/' '{ print $NF }')
    rm $fname
    wget $url

    if [ $? -eq 0 ]; then

        echo good
        tar xvf $fname
        cd $(echo $fname | sed 's/.tar.xz$//' | sed 's/.tar.gz$//')
        rm CHANGELOG.md LICENSE README.md
        sudo cp -R * /usr/local
        cd -
        rm -rf $(echo $fname | sed 's/.tar.xz$//' | sed 's/.tar.gz$//')
    else
        echo not good
    fi
fi

# Install NVM & NPM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.36.0/install.sh | bash
source ~/.bashrc

git clone git@github.com:2023SVBootcamp-Team-H/frontend.git
cd frontend
nvm install --lts
nvm use --lts
npm install
npm run build
cd ~
cp -r ~/frontend/dist ~/backend/data/nginx/html

# Docker-Compose File Copy
cp ~/backend/docker-compose.prod.yml ~/

# Docker-Compose Up
sudo docker-compose -f docker-compose.prod.yml up -d --build
