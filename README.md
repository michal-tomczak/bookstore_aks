# bookstore_aks
Bookstore application running on top of AKS cluster.

1. Clone repo
2. Login to azure, create service principal, and extract all required variables as per: https://learn.microsoft.com/en-us/azure/aks/learn/quick-kubernetes-deploy-terraform?tabs=bash
3. Add enviromental variables to ~/.bashrc, you should see the values when running:

printenv | grep ARM

TF_VAR_ARM_SUBSCRIPTION_ID=some_value

TF_VAR_ARM_TENANT_ID=some_value

TF_VAR_ARM_CLIENT_ID=some_value

TF_VAR_ARM_CLIENT_SECRET=some_value

5. Terraform init, plan and apply
6. Run extract kubeconfig shell script.
7. Download and install istio as per: https://istio.io/latest/docs/setup/getting-started/