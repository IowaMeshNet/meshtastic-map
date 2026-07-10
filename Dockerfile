FROM node:lts-alpine

WORKDIR /app

# Copy only package files and install deps
# This layer will be cached as long as package*.json don't change
COPY package*.json package-lock.json* ./
RUN npm ci

# Copy the rest of your source
COPY . .

# Fetch Meshtastic protobufs (GPLv3, kept out of this MIT repo — see docker/mqtt.sh)
RUN apk add --no-cache git && \
    git clone --depth 1 https://github.com/meshtastic/protobufs src/external/protobufs

# Ensure entrypoint scripts are executable (git doesn't reliably preserve +x)
RUN chmod +x docker/map.sh docker/mqtt.sh

RUN apk add --no-cache openssl

EXPOSE 8080