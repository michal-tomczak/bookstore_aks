#!/bin/bash

(terraform output kube_config) > /root/.kube/azurek8s.conf
sed -i '/EOT/d' /root/.kube/azurek8s.conf
sed -i '/^$/d' /root/.kube/azurek8s.conf
export KUBECONFIG=/root/.kube/azurek8s.conf
kubectl get nodes
