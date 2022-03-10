Before we start deploying stuff we need to ensure that Terraform can store it's state into a storage account. We also need to ensure that our pipeline can successfully authenticate with that particular storage account. By saving our service principal credentials to a keyvault we can ensure no sensitive information is exposed in our deployments.


Part 1 - Creating a Terraform launchpad
===

We will be creating a storage account and a keyvault. We will be using bash cloud shell in order to complete the following steps

```bash
RG_NAME="ado-demo-weeu-dev-001"
LOCATION="westeurope"
STORAGE_ACCOUNT_NAME="statfweeudev${RANDOM}001"
KEYVAULT_NAME="keyv-tf-dev-${RANDOM}-001"
az group create -n "${RG_NAME}" -l "${LOCATION}"
az storage account create -n ${STORAGE_ACCOUNT_NAME} -g "${RG_NAME}"
az storage account container -n connectivity-weeu-dev-001 --account-name ${STORAGE_ACCOUNT_NAME}
az keyvault create -n ${KEYVAULT_NAME} -g "${RG_NAME}"
```

Part 2 - Adding secrets to keyvault
===

Create the following secrets in keyvault

* `svc-azr-devops-subscription-id` = you msdn subscription-id
* `svc-azr-devops-client-secret`= the secret you saved earlier
* `svc-azr-devops-client-id` = the client id of your service principal
* `svc-azr-devops-tenant-id` = the tenant id of azure tenant
* `svc-azr-devops-storage-account-name` = the name of your newly created storage account

Part 3 - Creating a variable group in DevOps

Before we start creating pipelines we need to make sure devops has a connection to our newly created keyvault. The following steps show how to create a connection to a keyvault and creating a new variable group

1. Inside your DevOps project go to `Pipelines` > `Library` > `+ Variable group`.
1. Name your new variable group `devops-service-connection-credentials`
1. Enable "Link secrets from an Azure keyvault as variables"
1. Choose your service connection from the SUbscription id dropdown menu
1. Choose the keyvault that you have created earlier
1. Proceed to add the secret from keyvault to the variable group
1. Dont forget to save!