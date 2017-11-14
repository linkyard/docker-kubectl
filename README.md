# Docker image with kubectl and some useful tooling

Based on alpine.

Included are:
- kubectl
- jq
- curl
- bash


# Init Script
For cases where it does not directly run inside a kubernetes cluster an init script is
provided at `/opt/initK8s.sh`.

It needs the following parameters:
- `KUBERNETES_URL`: URL to the kubernetes cluster
- `KUBERNETES_CA`: Base64 encoded CA certifcate for the connection to the cluster
- `KUBERNETES_TOKEN`: Token to authenticate with the cluster
