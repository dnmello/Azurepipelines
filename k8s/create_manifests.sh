#!/usr/bin/env bash

export APP=dbserver-self-hosted-agent

export NAMESPACE=${1}
export IMAGE=${2}
export NODE_ENV=${3}
export AZP_URL=${4}
export AZP_TOKEN=${5}
export AZP_POOL=${6}
export REPLICAS=${7}
export IMAGE_PULL_SECRETS=${8}

echo "Creating K8S manifest files"}
echo "Usage: ./create_manifests.sh <NAMESPACE> <IMAGE> <NODE_ENV> <AZP_URL> <AZP_TOKEN> <AZP_POOL> <REPLICAS> <IMAGE_PULL_SECRETS>"

mkdir -p .generated

for f in templates/*.yml
do
    touch ".generated/$(basename $f)"
    envsubst < $f > ".generated/$(basename $f)"
done
