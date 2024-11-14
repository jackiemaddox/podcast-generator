FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-full \
    python3-pip3 \
    git

RUN pip3 install --user PyYAML

COPY feed.py /usr/bin/feed.py

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]