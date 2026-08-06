ARG BUILD_ARCH
ARG BUILD_FROM=ghcr.io/home-assistant/${BUILD_ARCH}-base:3.23-2026.04.0
FROM ${BUILD_FROM}

ARG CODEX_VERSION=0.146.1

RUN apk add --no-cache \
        bash \
        bash-completion \
        ca-certificates \
        curl \
        git \
        jq \
        nano \
        nodejs \
        npm \
        openssh \
        python3 \
        ripgrep \
        tmux \
        vim \
    && npm install --global "@openai/codex@${CODEX_VERSION}" \
    && npm cache clean --force \
    && codex --version

COPY rootfs /

LABEL \
    org.opencontainers.image.title="Home Assistant App: Codex CLI" \
    org.opencontainers.image.description="Codex CLI als SSH-Host für Home Assistant OS" \
    org.opencontainers.image.source="https://github.com/JxnLexn/homeassistant-codex-cli" \
    org.opencontainers.image.licenses="MIT"
