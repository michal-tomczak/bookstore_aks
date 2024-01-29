#!/bin/bash

echo "$(terraform output kube_config)" > ./azurek8s;
sed -i '/EOT/d' ./terraform_aks/azurek8s;
sed -i '/^$/d' ./terraform_aks/azurek8s;
export KUBECONFIG=./terraform_aks/azurek8s;
kubectl get nodes
