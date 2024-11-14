FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-full \
    python3-pip \
    git \
    && rm -rf /var/lib/apt/lists/*

# Create and activate the virtual environment, and install PyYAML
RUN python3 -m venv /myenv && \
    /bin/bash -c "source /myenv/bin/activate && pip install PyYAML"

COPY feed.py /usr/bin/feed.py

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]