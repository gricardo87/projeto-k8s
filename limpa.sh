#!/bin/bash
# Excluir todos os recursos do Kubernetes
echo "Excluindo todos os recursos do Kubernetes..."
kubectl delete --all deployments --all-namespaces
kubectl delete --all services --all-namespaces
kubectl delete --all configmaps --all-namespaces
kubectl delete --all secrets --all-namespaces
kubectl delete --all persistentvolumeclaims --all-namespaces
kubectl delete --all persistentvolumes --all-namespaces

# Excluir o cluster kind
echo "Excluindo o cluster minikube..."
minikube delete --all

# Limpeza no ambiente docker
for i in $(docker ps -a -q);do docker rm $i -f;done
for i in $(docker images -a -q);do docker rmi $i -f;done
docker system prune -f
docker volume prune -f

echo "Limpeza completa!"