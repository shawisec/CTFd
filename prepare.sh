#!/bin/sh
sudo apt-get update
sudo apt-get install build-essential python-dev python-pip libffi-dev -y
pip install -r requirements.txt

# Initialize database
python manage.py db upgrade
if [ ! -f logs/shawisec.zip ] ; then
  echo "NO data imported"
else
  python import.py logs/shawisec.zip challenges
  rm -f logs/shawisec.zip #Importation une seule fois
fi