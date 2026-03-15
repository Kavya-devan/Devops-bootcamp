#!/bin/bash

echo "Deploying kavya.com"

python3 -m venv venv
source venv/bin/activate

pip install flask gunicorn

gunicorn app:app -b 0.0.0.0:8000
