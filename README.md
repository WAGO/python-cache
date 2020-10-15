# python-cache

Start the container with an interactive terminal:
docker run --platform=linux/arm/v7 --rm -it registry.mylan/python-cache-updater

Collect /build wheels with:
collect-wheels.sh <wheel1> <wheel2> ...

Publish wheel to Innovation Python Package Index
publish-wheels.sh