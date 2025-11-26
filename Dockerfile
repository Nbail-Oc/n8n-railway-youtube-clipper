FROM node:18-alpine

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

# Create non-root user
RUN addgroup -g 1000 n8n && \
    adduser -D -u 1000 -G n8n n8n && \
    mkdir -p /home/n8n/.n8n && \
    chown -R n8n:n8n /home/n8n

USER n8n

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