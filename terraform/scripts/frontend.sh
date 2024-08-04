#!/bin/bash
sudo apt-get update -y
sudo apt-get install -y docker.io
sudo systemctl start docker
sudo usermod -a -G docker ec2-user
docker login -u ashanna -p Ayush887766@
sudo docker pull ashanna/frontend_image:latest
sudo docker run -d -p 80:80 ashanna/frontend_image:latest 
