FROM ubuntu:18.04
RUN apt-get update && \
    apt-get install -y \
    vim \
    sudo \
    curl \
    wget \
    python3.8 \
    python3-pip \
    libgl1-mesa-dev
ENV PYTHONUNBUFFERED 1
RUN mkdir /code
WORKDIR /code
COPY requirements.txt /code/
RUN pip3 install --upgrade pip && \
    pip3 install -r requirements.txt
