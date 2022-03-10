Requirements
===
* An active MSDN subscription
* A DevOps organization connected to your MSDN environment


Part 1 - Creating a service connection
===

In order to create a service connection we need to register a new application in Azure AD.

1. Navigate to the Azure portal > Azure Active Directory
1. In the left side navigation tree click on "App registrations"
1. Inside the App registrations blade click on "New registration"
1. Provide the name `azure-devops-demo-sp`
1. After creation register a new secret. Do so by navigating to the newly registered application's "Certificates & Secrets" blade and click on "New client secret".
1. Choose 3 months here and write a description of choice.
1. Save the secret to notepad or similar, you will need it later in this excercise.

Part 2 - Permissions
===
Before we create the service connection from Azure DevOps to Azure Resource Manager we need to ensure that our newly registered app is allowed to write to our Azure Subscription. 

1. Navigate to the "Subscriptions" blade in the Azure portal and choose your MSDN subscription.
1. When inside the subscription blade you need to go to `Access Control (IAM)` > `Role Assignments` > `Add`
1. Search for the name `azure-devops-demo-sp` and assign it the "Contributor" role.
1. Wait for the assignment to finish

Part 3 - Creating a Service Connection
===
Now we are ready to create a connection between Azure DevOps and Azure Resource Manager.

1. Create a new project named "ado-project-demo"
1. Navigate to "Project Settings" once inside the newly project's page.
1. Go to "Service connections" and click on "Create service connection"
1. From the dialogue menu choose "Azure Resource Manager" > Next > Service Principal (manual)
1. Gather the following from Azure
    1. **Subscription ID**
    1. **Subscription Name**
    1. **Service Principal ID** (this is your app registration)
    1. **Service principal secret** (which you saved earlier)
    1. **Tenant ID**
1. Once everything is filled in click on "Verify"
1. Re-use the name `azure-devops-demo-sp` in the name
1. Save and continue

Congratulations! Now you are done :) 