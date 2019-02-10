#!/bin/bash
sleep 2

cd /home/container


# Run the Bot
python3.7 -m pip install -U Red-DiscordBot --user
pip3 install aiohttp websockets pynacl opuslib libopus0