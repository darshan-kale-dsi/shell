#!/bin/bash
set -x

############################################
# DSI CONSULTING INC. Project setup script #
############################################
# This script creates standard analysis and output directories
# for a new project. It also creates a README file with the
# project name and a brief description of the project.
# Then it unzips the raw data provided by the client.

mkdir analysis output
touch README.md
touch analysis/main.py

# download client data
wget -O rawdata.zip https://github.com/UofT-DSI/shell/raw/refs/heads/main/02_activities/assignments/rawdata.zip
unzip rawdata.zip

###########################################
# Complete assignment here

# 1. Create a directory named data
mkdir data

# 2. Move the ./rawdata directory to ./data/raw
mv rawdata data/raw/
# 3. List the contents of the ./data/raw directory
ls data/raw

# 4. In ./data/processed, create the following directories: server_logs, user_logs, and event_logs

mkdir -p data/processed/server_logs data/processed/user_logs data/processed/event_logs

# 5. Copy all server log files (files with "server" in the name AND a .log extension) from ./data/raw to ./data/processed/server_logs
for file in data/raw/*server*.log; do
  cp "$file" data/processed/server_logs/
done

# 6. Repeat the above step for user logs and event logs
for file in data/raw/*user*.log; do
  cp "$file" data/processed/user_logs/
done

for file in data/raw/*event*.log; do
  cp "$file" data/processed/event_logs/
done

# 7. For user privacy, remove all files containing IP addresses (files with "ipaddr" in the filename) from ./data/raw and ./data/processed/user_logs
for file in data/raw/*ipaddr*; do
  rm "$file"
done

for file in data/processed/user_logs/*ipaddr*; do
  rm "$file"
done

# 8. Create a file named ./data/inventory.txt that lists all the files in the subfolders of ./data/processed
ls /data/processed/ > ./data/inventory.txt


###########################################

echo "Project setup is complete!"
