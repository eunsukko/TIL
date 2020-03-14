sudo apt-get update

sudo apt-get remove docker docker-engine docker.io

sudo apt install docker.io

sudo systemctl start docker
sudo systemctl enable docker

sudo apt intall docker-compose


cd docker
sudo docker-compose up -d