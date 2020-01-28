#!/usr/bin/env bash
# This is the command used to initially install Fairwinds Polaris in the video.

# See https://github.com/FairwindsOps/polaris/blob/master/docs/usage.md#dashboard

helm repo add fairwinds-stable https://charts.fairwinds.com/stable

helm install --name polaris \
  --namespace polaris \
fairwinds-stable/polaris
# See also, my-values.yaml, used later in the video.

