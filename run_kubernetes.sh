#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
# dockerpath=<>
dockerpath=0732954865v/microservice01

# Step 2
# Run the Docker Hub container with kubernetes
kubectl run predictionpod --image=$dockerpath --port=80

# Step 3:
# List kubernetes pods
echo "All the pods: \n"
kubectl get pods
kubectl wait --for=condition=Ready pod/predictionpod

# Step 4:
# Forward the container port to a host
kubectl port-forward pod/predictionpod --address 0.0.0.0 8000:80
