FROM ubuntu:18.04

MAINTAINER JaL, <jack@jalbp.xyz>

ARG DEBIAN_FRONTEND=noninteractive

RUN apt update \
    && apt upgrade -y \
    && apt autoremove -y \
    && apt autoclean \
    && apt -y install curl software-properties-common locales git cmake \
    && useradd -d /home/container -m container

    # Ensure UTF-8
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV TZ=America/New_York

    # Python3 & Bot Dependencies
RUN apt -y install python3.7 python3.7-dev python3.7-venv python3-pip build-essential libssl-dev libffi-dev git unzip default-jre \
    && python3.7 -m pip install -U Red-DiscordBot --user

USER container
ENV  USER container
ENV  HOME /home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]