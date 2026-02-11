# Multi-variant Dockerfile for Next.js, Go, Python, and Laravel development environments
ARG VARIANT=nextjs-shadcn
ARG NODE_VERSION=20
ARG GO_VERSION=1.21
ARG PYTHON_VERSION=3.11
ARG PHP_VERSION=8.2

# Next.js variant stage
FROM node:${NODE_VERSION}-bookworm as nextjs-shadcn

# Install Bun
RUN curl -fsSL https://bun.sh/install | bash
ENV PATH="/root/.bun/bin:${PATH}"

# Install common utilities
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
    git \
    curl \
    wget \
    ca-certificates \
    sudo \
    zsh \
    vim \
    nano \
    && apt-get clean -y && rm -rf /var/lib/apt/lists/*

# Create non-root user
ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

# Install Bun for vscode user
USER $USERNAME
RUN curl -fsSL https://bun.sh/install | bash
ENV PATH="/home/vscode/.bun/bin:${PATH}"

WORKDIR /workspace

# Go variant stage
FROM golang:${GO_VERSION}-bookworm as go

# Install common utilities
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
    git \
    curl \
    wget \
    ca-certificates \
    sudo \
    zsh \
    vim \
    nano \
    && apt-get clean -y && rm -rf /var/lib/apt/lists/*

# Create non-root user
ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

# Install Go tools
USER $USERNAME
RUN go install golang.org/x/tools/gopls@latest \
    && go install github.com/go-delve/delve/cmd/dlv@latest \
    && go install honnef.co/go/tools/cmd/staticcheck@latest

WORKDIR /workspace

# Python variant stage
FROM python:${PYTHON_VERSION}-bookworm as python

# Install common utilities
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
    git \
    curl \
    wget \
    ca-certificates \
    sudo \
    zsh \
    vim \
    nano \
    build-essential \
    && apt-get clean -y && rm -rf /var/lib/apt/lists/*

# Create non-root user
ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

# Install Python tools
USER $USERNAME
RUN pip install --user --upgrade pip setuptools wheel \
    && pip install --user pylint black flake8 mypy pytest

WORKDIR /workspace

# Laravel variant stage
FROM php:${PHP_VERSION}-fpm-bookworm as laravel

# Install system dependencies
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
    git \
    curl \
    wget \
    ca-certificates \
    sudo \
    zsh \
    vim \
    nano \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    libzip-dev \
    zip \
    unzip \
    nodejs \
    npm \
    && apt-get clean -y && rm -rf /var/lib/apt/lists/*

# Install PHP extensions
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd zip

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Create non-root user
ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

# Set working directory
WORKDIR /workspace

# Switch to non-root user
USER $USERNAME

# Install Laravel installer globally
RUN composer global require laravel/installer

# Add Composer global bin to PATH
ENV PATH="/home/vscode/.config/composer/vendor/bin:${PATH}"

# Final stage - select variant
FROM ${VARIANT} as final

USER vscode
WORKDIR /workspace
