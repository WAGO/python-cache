#!/bin/bash
docker run --rm -t -v $PWD/cache:/root/.cache wagoautomation/wago-python:3.8-armv7 pip install $@
sudo chmod -R 777 cache/