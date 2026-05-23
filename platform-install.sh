#!/usr/bin/env bash
# Bootstraps the full platform on a fresh cluster
# Usage: ./scripts/bootstrap/platform-install.sh dev aws

set -euo pipefail
ENV=${1:-dev}
CLOUD=${2:-aws}

echo "Bootstrapping enterprise-k8s-platform | env=$ENV cloud=$CLOUD"

kubectl create namespace argocd --dry-run=client -o yaml | kubectl apply -f -
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
kubectl wait --for=condition=available deployment/argocd-server -n argocd --timeout=180s

istioctl install --set profile=default -y
kubectl label namespace default istio-injection=enabled --overwrite

helm upgrade --install gatekeeper gatekeeper/gatekeeper --namespace gatekeeper-system --create-namespace
kubectl apply -f policies/constraint-templates/
kubectl apply -f policies/constraints/

helm upgrade --install vault hashicorp/vault --namespace vault --create-namespace
helm upgrade --install monitoring prometheus-community/kube-prometheus-stack \
  --namespace monitoring --create-namespace -f environments/$ENV/values.yaml

kubectl apply -f gitops/argocd/projects/
kubectl apply -f gitops/argocd/applicationsets/

echo "Done! ArgoCD: kubectl port-forward svc/argocd-server -n argocd 8080:443"
