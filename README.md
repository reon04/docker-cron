# docker-cron
[![Publish Release and Build Docker](https://github.com/reon04/docker-cron/actions/workflows/release.yml/badge.svg)](https://github.com/reon04/docker-cron/actions/workflows/release.yml)

Docker container for running cron jobs in other docker containers. Notifications from cron inside the container are send using a Discord webhook.

## Example Setup
Create the crontab file on the host file system and define the desired cron jobs (use `docker exec` to execute cron jobs in other docker containers):
```bash
SHELL=/bin/bash
PATH=/sbin:/bin:/usr/sbin:/usr/bin
MAILTO=root

# do daily/weekly/monthly maintenance
# min   hour    day     month   weekday command
0       0       *       *       *       docker exec container command
```

Deploy the container using docker compose (change the path of the crontab file on the host and the Discord webhook URL):
```yml
services:
  cron:
    container_name: cron
    image: "ghcr.io/reon04/docker-cron:latest"
    restart: unless-stopped
    environment:
      WEBHOOK_URL: "DISCORD_WEBHOOK_URL"
    volumes:
      - /path/to/crontab:/etc/crontabs/root:ro
      - /var/run/docker.sock:/var/run/docker.sock:ro
```