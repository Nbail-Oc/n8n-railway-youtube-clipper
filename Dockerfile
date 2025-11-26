FROM n8nio/n8n:latest

USER root

# Install system dependencies
RUN apk add --no-cache \
    python3 \
    py3-pip \
    ffmpeg \
    git \
    bash

# Install yt-dlp
RUN pip3 install --break-system-packages yt-dlp

# Fix permissions for n8n config
RUN mkdir -p /home/node/.n8n && \
    chown -R node:node /home/node/.n8n && \
    chmod 700 /home/node/.n8n

USER node

# Set environment variables
ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=5678
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true

# Expose n8n port
EXPOSE 5678

# Use the correct entrypoint from base image
CMD ["node", "/usr/local/lib/node_modules/n8n/bin/n8n"]