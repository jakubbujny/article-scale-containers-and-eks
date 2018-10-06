#!/usr/bin/env bash

cd aws

terraform apply

terraform output kubeconfig > ../kubeconfig.yaml

terraform output config-map-aws-auth > ../config-map-aws-auth.yaml

cd ..

#./kubectl.sh apply -f https://raw.githubusercontent.com/aws/amazon-vpc-cni-k8s/release-1.1/config/v1.1/calico.yaml

./kubectl.sh apply -f https://raw.githubusercontent.com/kubernetes/heapster/master/deploy/kube-config/influxdb/heapster.yaml

./kubectl.sh apply -f config-map-aws-auth.yaml

./kubectl.sh apply -f aws/eks-admin-service-account.yaml

./kubectl.sh apply -f aws/eks-admin-cluster-role-binding.yaml

./kubectl.sh apply -f https://raw.githubusercontent.com/kubernetes/dashboard/master/src/deploy/recommended/kubernetes-dashboard.yaml
