FROM node:20-alpine

WORKDIR /usr/src/app

# Install system dependencies
RUN apk add --no-cache \
    python3 \
    py3-pip \
    ffmpeg \
    git \
    bash \
    tini

# Install yt-dlp
RUN pip3 install --break-system-packages yt-dlp

# Install n8n globally
RUN npm install -g n8n

# Setup directories (node user already exists in base image)
RUN mkdir -p /home/node/.n8n && \
    chown -R node:node /home/node/.n8n && \
    chmod 700 /home/node/.n8n

USER node

# Environment variables
ENV N8N_HOST=0.0.0.0 \
    N8N_PORT=5678 \
    N8N_PROTOCOL=http \
    NODE_ENV=production \
    EXECUTIONS_MODE=regular \
    N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true

EXPOSE 5678

# Use tini for proper signal handling
ENTRYPOINT ["/sbin/tini", "--"]

# Start n8n
CMD ["n8n"]