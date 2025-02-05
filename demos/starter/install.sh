#!/bin/bash

# SPDX-FileCopyrightText: 2025 Deutsche Telekom AG and others
#
# SPDX-License-Identifier: Apache-2.0

# Exit immediately if a command exits with a non-zero status
#set -e

SCRIPT_DIR=$(dirname "$0")
source "$SCRIPT_DIR/../../.env"

# Install agents
kubectl delete secret openai-secrets 2>/dev/null
kubectl create secret generic openai-secrets \
    --from-literal=ARC_AI_CLIENTS_0_APIKEY="$OPENAI_APIKEY" \
    --from-literal=ARC_AI_CLIENTS_0_MODELNAME="$OPENAI_MODELNAME" \
    --from-literal=ARC_AI_CLIENTS_0_URL="$OPENAI_URL" \
    --from-literal=ARC_AI_CLIENTS_0_ID="OPENAI" \
    --from-literal=ARC_AI_CLIENTS_0_CLIENT="$OPENAI_CLIENTNAME"

helm upgrade --install weather-agent oci://ghcr.io/eclipse-lmos/weather-agent-chart --version 0.1.0-SNAPSHOT
helm upgrade --install news-agent oci://ghcr.io/eclipse-lmos/news-agent-chart --version 0.1.0-SNAPSHOT

while ! kubectl get pods | grep weather-agent | grep -q Running; do sleep 1; done
while ! kubectl get pods | grep news-agent | grep -q Running; do sleep 1; done

nohup kubectl port-forward svc/weather-agent 8100:8080 >/dev/null 2>&1 &
nohup kubectl port-forward svc/news-agent 8101:8080 >/dev/null 2>&1 &

echo "Setting up channel..."
# Stable Channel – Includes the weather agent and news agent
kubectl apply -f "$SCRIPT_DIR/acme-web-stable-channel.yml"
