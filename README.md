# bookstore_aks
Bookstore application running on top of AKS cluster created by Terraform, with terraform state file stored in Azure Storage Account.

1. Clone repo
2. Az login
3. cd to terraform_sa directory.
4. Terraform init, plan, apply.
5. Storage Account should be now created in Azure.
6. Login to azure, create service principal, and extract all required variables as per: https://learn.microsoft.com/en-us/azure/aks/learn/quick-kubernetes-deploy-terraform?tabs=bash
7. Add enviromental variables to ~/.bashrc or ~/.zshrc, you should see the values when running:

printenv | grep ARM

TF_VAR_ARM_SUBSCRIPTION_ID=some_value

TF_VAR_ARM_TENANT_ID=some_value

TF_VAR_ARM_CLIENT_ID=some_value

TF_VAR_ARM_CLIENT_SECRET=some_value

8. cd .. from terraform_sa. (Now your tfstate file should be stored in Azure blob container)
9. Terraform init -reconfigure, plan and apply
10. Chmod 777 extract_kubeconfig.sh and ./extract_kubeconfig.sh 
11. Then run export KUBECONFIG=/root/.kube/azurek8s.conf (after this step you should be able to control your k8s cluster with kubectl)
12. Download and install istio as per: https://istio.io/latest/docs/setup/getting-started/
13. Follow istio documentation in order to install sample bookinfo application:

kubectl apply -f samples/bookinfo/platform/kube/bookinfo.yaml
kubectl apply -f samples/bookinfo/networking/bookinfo-gateway.yaml

Verify if your service has External IP available:
kubectl get svc istio-ingressgateway -n istio-system

export INGRESS_HOST=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
export INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="http2")].port}')
export SECURE_INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="https")].port}')
export GATEWAY_URL=$INGRESS_HOST:$INGRESS_PORT

Use below echo command, use the link from its output to access the application from your browser:
echo "http://$GATEWAY_URL/productpage"


To destroy the environment:

1. In main project directory run terraform destroy
2. cd to terraform_sa directory and run terraform destroy again.
