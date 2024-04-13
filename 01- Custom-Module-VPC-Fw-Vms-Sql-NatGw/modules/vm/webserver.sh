!/bin/bash
sudo apt update -y
sudo apt upgrade -y
sudo apt autoremove -y
sudo ufw allow proto tcp from any to any port 22,80,443
sudo apt install zip unzip wget net-tools vim nano htop tree -y
sudo apt install nginx -y 
cd /var/www/html
sudo wget https://www.free-css.com/assets/files/free-css-templates/download/page292/fables.zip
sudo unzip fables.zip
sudo mv fables-master/ html
sudo rm -rf  fables.zip
sudo rm -rf index.nginx-debian.html
cd html
sudo cp -r * ..
cd ..
sudo rm -rf html
sudo echo 'y' | sudo ufw enable
sudo systemctl enable nginx --now