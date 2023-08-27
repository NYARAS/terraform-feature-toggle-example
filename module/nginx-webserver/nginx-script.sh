#!/bin/bash

sudo yum update -y
sudo amazon-linux-extras install nginx1 -y 
sudo systemctl enable nginx
sudo systemctl start nginx
echo "<h1>This is "${file_content}!"</h1>" > /usr/share/nginx/html/index.html
