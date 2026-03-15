Steps performed:
1. Created EC2 instance
2. Installed Python and Nginx
3. Created Flask application
4. Used Gunicorn to run application
5. Configured Nginx reverse proxy
6. Mapped domain kavya-devops.xyz
7. Enabled HTTPS using Certbot

# Week 3 - Deploying Application on EC2

## Project Overview
In this project we deployed a Python Flask application on AWS EC2 using Nginx and Gunicorn and secured it using HTTPS.

Domain: https://kavya-devops.xyz

---

## Architecture

User
↓
Domain (Hostinger DNS)
↓
EC2 Instance
↓
Nginx Reverse Proxy
↓
Gunicorn
↓
Flask Application

---

## Step 1: Create EC2 Instance
- Launch EC2 instance in AWS
- OS: Amazon Linux
- Configure security group
- Allow ports:
  - 22 (SSH)
  - 80 (HTTP)
  - 443 (HTTPS)

---

## Step 2: Connect to EC2

ssh -i key.pem ec2-user@<EC2-IP>

---

## Step 3: Install Required Packages

sudo yum update -y
sudo yum install python3 git nginx -y

---

## Step 4: Create Python Virtual Environment

python3 -m venv venv
source venv/bin/activate

---

## Step 5: Install Dependencies

pip install flask gunicorn

---

## Step 6: Create Flask Application

app.py

from flask import Flask
app = Flask(__name__)

@app.route("/")
def home():
    return "Hello from kavya-devops.xyz"

---

## Step 7: Run Application using Gunicorn

gunicorn app:app -b 0.0.0.0:8000

---

## Step 8: Configure Nginx

Create nginx configuration:

server {
    listen 80;
    server_name kavya-devops.xyz;

    location / {
        proxy_pass http://127.0.0.1:8000;
    }
}

Restart nginx:

sudo systemctl restart nginx

---

## Step 9: Configure Domain DNS

In Hostinger DNS:

A record

kavya-devops.xyz → 13.200.48.136

---

## Step 10: Enable HTTPS

Install certbot

sudo yum install certbot python3-certbot-nginx

Generate certificate

sudo certbot --nginx

---

## Final Result

Application available at:

https://kavya-devops.xyz
