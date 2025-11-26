# Use N8N base image
FROM n8nio/n8n:latest

# Switch to root to install packages
USER root

# Install system dependencies
RUN apk add --no-cache \
    python3 \
    py3-pip \
    ffmpeg \
    bash \
    curl

# Install yt-dlp
RUN pip3 install --break-system-packages yt-dlp

# Create working directory for temp files
RUN mkdir -p /home/node/.n8n && \
    chown -R node:node /home/node/.n8n

# Switch back to node user
USER node

# Expose N8N port
EXPOSE 5678

# Start N8N
CMD ["n8n"]