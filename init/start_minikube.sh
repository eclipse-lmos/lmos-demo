#!/bin/bash

# SPDX-FileCopyrightText: 2024 Deutsche Telekom AG
#
# SPDX-License-Identifier: Apache-2.0

# Exit immediately if a command exits with a non-zero status
set -e

minikube delete || true

# Start Minikube
echo "Starting Minikube..."
minikube start --driver=docker --memory=6000 --cpus=4
export KUBE_EDITOR="code -w" 
echo "Minikube setup complete."