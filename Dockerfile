FROM ubuntu:22.04

# Avoid interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    curl \
    git \
    python3 \
    python3-pip \
    nodejs \
    npm \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Copy project files
WORKDIR /app
COPY . /app

# Install python deps for gensyn (placeholder)
RUN pip3 install --no-cache-dir -r /app/gensyn/requirements.txt || true

# Install node deps for bots
RUN cd /app/galxe-bot && npm install --no-audit --no-fund || true
RUN cd /app/layer3-bot && npm install --no-audit --no-fund || true

# Make start script executable
RUN chmod +x /app/start.sh
RUN chmod +x /app/scripts/*.sh

# Default command: run the startup script
CMD ["/app/start.sh"]
