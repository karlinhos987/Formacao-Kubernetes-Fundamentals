#!/bin/bash

echo "Criando as imagens..."

docker build -t karlinhos987/projeto-ks8-backend:1.0 backend/.
docker build -t raicamposs/projeto-ks8-database:1.0 database/.

echo "Realizando push..."

docker push raicamposs/projeto-ks8-backend:1.0 
docker push raicamposs/projeto-ks8-database:1.0

echo "Criando serviços no cluster kubernetes..."

kubectl apply -f ./services.yml

echo "Criando deployments..."

kubectl apply -f ./deployment.yml

minikube service php --url
minikube tunnel --cleanup