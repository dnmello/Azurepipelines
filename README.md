# Projeto Azure Pipelines Agents

## Objetivo

O objetivo deste projeto é prover agentes do Azure Pipelines do tipo Self-Hosted baseados na tecnologia Docker.

## Deploy Manual Agentes

### Azure CLI Login

```
az login --service-principal -u "<username>" -p "<password>" --tenant <tenant_id>
```

### Get AKS Credentials

```
az aks get-credentials --resource-group "<resource_group_name>" --name "<aks_service_name>"
```

### Create Deployment Manifest

```
cd k8s

./create_manifests.sh <NAMESPACE> <IMAGE> <NODE_ENV> <AZP_URL> <AZP_TOKEN> <AZP_POOL> <REPLICAS> <IMAGE_PULL_SECRETS>"
```

### Create Registry Secrets

```
kubectl create secret docker-registry dbregsecret \
--docker-server=<server>.azurecr.io \
--docker-username=<username> \
--docker-password=<password> \
--docker-email=devops.service@dbserver.com.br \
--namespace devops-agents
```

### Kubectl Apply

```
cd k8s

kubectl apply -f .generated/deployment.yml
```