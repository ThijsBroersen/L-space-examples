#!/bin/bash
docker run -p 8888:8888 -v "$PWD"/work:/home/jovyan/work lspace/jupyter-beakerx
