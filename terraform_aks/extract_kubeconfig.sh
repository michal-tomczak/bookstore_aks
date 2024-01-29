#!/bin/bash

echo "$(terraform output kube_config)" > ./azurek8s;
sed -i '/EOT/d' ./azurek8s;
sed -i '/^$/d' ./azurek8s;
export KUBECONFIG=./azurek8s;
kubectl get nodes
