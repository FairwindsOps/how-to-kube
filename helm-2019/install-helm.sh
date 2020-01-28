#!/usr/bin/env bash
# *** Do not run this in a cluster that already has Helm installed. ***
#
# These are the commands shown in the video,
# that install Helm in a test cluster.
# This used Helm 2.14.3.
# The HELm client must first be installed on your workstation, from http://helm.sh


## Create the service account and ClusterRole binding.
## See https://helm.sh/docs/using_helm/#role-based-access-control
cat <<EOF |kubectl apply -f -
apiVersion: v1
kind: ServiceAccount
metadata:
  name: tiller
  namespace: kube-system
---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: tiller
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: cluster-admin
subjects:
  - kind: ServiceAccount
    name: tiller
    namespace: kube-system
EOF


## Install the Helm component into Kubernetes.
## See https://helm.sh/docs/using_helm/#easy-in-cluster-installation
helm init \
  --history-max 200 \
  --service-account tiller


