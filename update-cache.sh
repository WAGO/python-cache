#!/bin/bash
sudo docker run --rm -t --name cache-updater -v $PWD/.cache:/root/.cache wagoautomation/python-cache-updater pip install --upgrade pip $@
sudo chmod -R 777 .cache/