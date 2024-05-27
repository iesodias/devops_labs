# 3 - Understand Terraform Basics

Understanding the basics of Terraform involves grasping key concepts, the structure of Terraform configuration files, and the essential commands to manage infrastructure.

## Key Concepts
### Providers:

Providers are plugins that enable Terraform to interact with APIs of cloud providers, SaaS providers, and other services. Each provider offers resources and data sources that Terraform can manage.

Example: aws, azurerm, google, kubernetes, etc.

### Resources:

Resources are the basic building blocks in Terraform. They represent components of your infrastructure, such as virtual machines, storage, and networking elements.
Example: An AWS EC2 instance can be defined as a resource in Terraform.

### Data Sources:

Data sources allow Terraform to fetch data from providers or other sources to be used in your configuration. They enable you to retrieve information that is defined outside of Terraform.
Example: Fetching the latest AMI ID from AWS.

### Modules:

Modules are containers for multiple resources that are used together. They are used to organize and encapsulate configuration segments, making code more reusable and maintainable.
Example: A module can manage all the resources required for a web server cluster, including instances, load balancers, and security groups.

### State:

Terraform uses a state file to keep track of the resources it manages. The state file maps your configuration to the real-world infrastructure. It allows Terraform to know what exists and what needs to be created, updated, or destroyed.
Example: The state file will contain the IDs of the resources created in your cloud provider.

### Basic Structure of a Terraform Configuration
Terraform configurations are written in HashiCorp Configuration Language (HCL) or JSON. The files usually have a .tf extension.

### Providers Block:

Specifies the providers required for the configuration.
```t
provider "aws" {
  region = "us-west-2"
}
```
### Resources Block:

Defines the infrastructure components.
```t
resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"

  tags = {
    Name = "example-instance"
  }
}
```
### Variables Block:

Allows the use of variables to make configurations more flexible and reusable.
```t
variable "region" {
  description = "The AWS region to deploy in"
  default     = "us-west-2"
}
```
### Outputs Block:

Specifies values to be returned after a successful apply operation.
```t
output "instance_id" {
  value = aws_instance.example.id
}
```
### Data Block:
Fetches information from external sources to use in your configuration.

```bash
data "aws_ami" "latest" {
  most_recent = true
  owners      = ["self"]

  filter {
    name   = "name"
    values = ["my-ami-*"]
  }
}
```
## Essential Terraform Commands

### terraform init:
Initializes a working directory containing Terraform configuration files. It downloads the necessary provider plugins.
```bash
terraform init
```
### terraform plan:
Creates an execution plan, showing what actions Terraform will take to achieve the desired state defined in the configuration files.
```t
terraform plan
```
### terraform apply:
Applies the changes required to reach the desired state of the configuration. It prompts for confirmation before making any changes.
```t
terraform apply
```
### terraform destroy:
Destroys the infrastructure managed by the configuration. This command will prompt for confirmation before deleting resources.
```t
terraform destroy
```
### terraform fmt:
Formats Terraform configuration files to a canonical format and style.
```t
terraform fmt
```
### terraform validate:
Validates the configuration files for syntax and internal consistency.
```t
terraform validate
```
### terraform import:
Imports existing infrastructure into Terraform's state, allowing Terraform to manage resources that were not originally created by Terraform.
```t
terraform import aws_instance.example i-1234567890abcdef0
```
### terraform state:
Provides commands to inspect and modify the state file.
```t
terraform state list
```







