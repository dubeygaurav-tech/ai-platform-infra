# 1. Create necessary namespaces
kubectl create namespace argocd
kubectl create namespace external-secrets
kubectl create namespace vault

# 2. Install ArgoCD
kubectl apply --server-side -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

# 3. Install External Secrets Operator (ESO)
helm repo add external-secrets https://charts.external-secrets.io
helm install external-secrets external-secrets/external-secrets -n external-secrets

# 4. Install Vault (Dev Mode)
helm repo add hashicorp https://helm.releases.hashicorp.com
helm install vault hashicorp/vault --namespace vault --set "server.dev.enabled=true"

# 5. Provide the "Root of Trust" secret (for ESO to talk to Vault)
kubectl create secret generic vault-token -n external-secrets --from-literal=token=$ROOT_TOKEN