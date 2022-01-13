# **Webapp with FrontDoor.**
## This script creates resources based on below architecture :

![](Webapp.png)

### **Assumptions in the architecture :**

1. We are using Azure WebApp for application deployment. (PaaS architecture) 
2. Application gateway is used for load balancing.
3. This architecture has Azure Front Door component as well, this is considering global redundancy in the mind. We can use same piece of code and deploy resource on another region, whcih would allow us to use Front Door for regional DR.

### **Explanation**

This code is parameterized and we are using different modules for every Azure Resource. This allows us to manage our code along with enabling the reusability. The parent directory **WebApp Deployment** contains two subfolders :

1. terraform-modules
     * This directory contains all the modules.
     * Any variable conditional needs to be checked in the variable.tf file under respective module
2. terraform-resources
    * This folder has these files :
        * main.tf -> This file contains all the resources that we are going to deploy.
        * variables.tf -> Variables are defined in this file.
        * terraform.tfvars -> Tfvars file is automatically loaded without any additional option. This is the file where you need to update your resource values\names.

### **Usage :**

**Things to keep in mind are :**

1. We are using Azure BLOB as backend configuration, so you need to ensure the storage account and container mentioned in the backend configuration exists.
2. Since we are using data block to fetch key vault secrets, where we store all our sensitive information. The key vault and the secrets should already exist.
3. App service site config is configured using line number 22 to 26 under *"WebApp Deployment\terraform-modules\webapp\main.tf"* file. The application framework can be changed using these lines (ex: Java, Python, DotNet etc.)

To run this example, simply follow to steps below:

1. Navigate to terraform-resources folder, if the terminal is opened in *WebApp Deployment* directory, use :

``` 
  cd terraform-resources
  terraform init
  terraform plan
  terraform apply

```
### **Explanation :**

1. Terraform init -> It initializes the directory and downloads required provider along with configuring the module.
2. Terraform plan -> This helps you verify the code is going to deploy the resources as expected. This also ensures we don't face any unwanted surprise. This isn't mandatory, but a recommended step.
3. Terraform apply -> This step applies the resources specified in this code. This will ask you to approve this later. We can skip manual approval by using --auto-approve parameter.

### **Best Practices & Recommendations**

1. Use Terraform workspaces for easier management of the deployments. This can also help us manage Dev, UAT and Production deployments instead of creating multiple state files\directories.
2. If you are creating new resources\variables. Ensure naming convention is easily relatable, since we have a lot of variables in this code.
3. Use conditionals to avoid unwanted surprises.
