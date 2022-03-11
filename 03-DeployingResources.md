Requirements
===

* You have created a service connection in the previous step

Part 1 - Adding Terraform to DevOps

1. Inside Azure DevOps go to repositories
1. On the drop down menu in the top choose "Import Git repository"
1. In "Clone URL" copy paste `https://github.com/benkoben/azure-devops-demo`

Part 2 - Creating CI/CD pipeline

Now that we have a code inside of our newly imported repository, we need to create a pipeline for deploying it to Azure.

1. Inside Azure DevOps navigate to pipelines > `New Pipeline` > `Azure Repos Git (yaml)` > `academy-devops-demo` > `Existing Azure Pipelines YAML file`
1. Choose the existing yaml file from main branch and click on "Continue"
1. Inspect the its contents and click on `Run` thereafter.
1. 