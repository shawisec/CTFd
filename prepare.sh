#!/bin/sh
sudo apt-get update
sudo apt-get install build-essential python-dev python-pip libffi-dev -y
pip install -r requirements.txt

# Initialize database
python manage.py db upgrade
if [ ! -f shawisec.zip ] ; then
  echo "NO data imported"
else
  python import.py shawisec.zip challenges
fi