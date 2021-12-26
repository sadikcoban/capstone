#/bin/bash
eval $(minikube -p custom docker-env)
#minikube start
skaffold dev
