# SPDX-FileCopyrightText: 2024 Deutsche Telekom AG
#
# SPDX-License-Identifier: Apache-2.0

# Use the base image from the devcontainer configuration
FROM mcr.microsoft.com/devcontainers/base:ubuntu

# Install istioctl
RUN curl -L https://istio.io/downloadIstio | sh - && \
    mv istio-* /usr/local/istio && \
    ln -s /usr/local/istio/bin/istioctl /usr/local/bin/istioctl && \
    chmod +x /usr/local/bin/istioctl && \
    chmod -R 755 /usr/local/istio

# Install Argo Rollouts
RUN curl -LO https://github.com/argoproj/argo-rollouts/releases/latest/download/kubectl-argo-rollouts-linux-amd64 && \
    chmod +x ./kubectl-argo-rollouts-linux-amd64 && \
    mv ./kubectl-argo-rollouts-linux-amd64 /usr/local/bin/kubectl-argo-rollouts

# Set environment variables if necessary
ENV PATH="/usr/local/istio/bin:${PATH}"
ENV ISTIO_HOME="/usr/local/istio"