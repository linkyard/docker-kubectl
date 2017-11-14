#!/bin/bash
set -eu
set -o pipefail

: "${KUBERNETES_URL?Need to set env variable KUBERNETES_URL}"

if [[ "$KUBERNETES_URL" =~ https.* ]]; then
  : "${KUBERNETES_CA?Need to set env variable KUBERNETES_CA}"
  : "${KUBERNETES_TOKEN?Need to set env variable KUBERNETES_TOKEN}"

  mkdir -p /root/.kube

  CA_PATH="/root/.kube/ca.pem"
  echo "$KUBERNETES_CA" | base64 -d > $CA_PATH
  kubectl config set-cluster default --server=$KUBERNETES_URL --certificate-authority=$CA_PATH

  kubectl config set-credentials k8s-user --token=$KUBERNETES_TOKEN
  kubectl config set-context default --cluster=default --user=k8s-user
else
  kubectl config set-cluster default --server=$KUBERNETES_URL
  kubectl config set-context default --cluster=default
fi
kubectl config use-context default
