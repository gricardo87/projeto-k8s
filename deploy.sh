#!/bin/bash -exu
# Criar um cluster minukube com root liberado
minikube start --force

# Install ingress minikube
minikube addons enable ingress

# Aplicar recursos do PostgreSQL
echo "Aplicando recursos do PostgreSQL..."
kubectl apply -f ./pgsql/pv.yaml
kubectl apply -f ./pgsql/secrets.yaml
kubectl apply -f ./pgsql/pvc.yaml
kubectl apply -f ./pgsql/service.yaml
kubectl apply -f ./pgsql/deployment.yaml

# Aplicar recursos do backend
echo "Aplicando recursos do backend..."
kubectl apply -f ./backend/hpa.yaml
kubectl apply -f ./backend/secrets.yaml
kubectl apply -f ./backend/configmap.yaml
kubectl apply -f ./backend/deployment.yaml
kubectl apply -f ./backend/services.yaml

# Aplicar recursos do frontend
echo "Aplicando recursos do frontend..."
kubectl apply -f ./frontend/configmap.yaml
kubectl apply -f ./frontend/deployment.yaml
kubectl apply -f ./frontend/service.yaml

# Aplicar recursos do ingress
echo "Aplicando recursos do ingress..."
sleep 30s;
kubectl apply -f ./ingress.yaml

echo "Deploy completo!"
