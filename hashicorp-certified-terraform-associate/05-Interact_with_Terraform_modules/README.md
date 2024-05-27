# 5 - Interact with Terraform Modules
Terraform modules are reusable units of configuration that encapsulate a group of resources used together. Modules help organize, reuse, and maintain infrastructure code, making it more manageable and scalable. Here's a detailed guide on how to interact with Terraform modules:

## Understanding Modules
### What is a Module?
- Definition: A module is a container for multiple resources that are used together. Every Terraform configuration has at least one module (the root module).
- Structure: Modules typically include a main.tf, variables.tf, outputs.tf, and optionally other .tf files.
- Why Use Modules?
- Reusability: Write the configuration once and reuse it across different parts of your infrastructure.
- Organization: Break down complex configurations into smaller, manageable pieces.
- Consistency: Ensure consistent resource definitions and configurations.
## Using a Module
### Module Structure
A typical module might include:
```bash
main.tf: The main configuration file defining resources.
variables.tf: Input variables for the module.
outputs.tf: Outputs from the module.
README.md: Documentation for the module.
```
## Example Module Configuration
### main.tf
```bash
resource "aws_instance" "example" {
  ami           = var.ami
  instance_type = var.instance_type

  tags = {
    Name = var.name
  }
}
```
### variables.tf
```bash
variable "ami" {
  description = "The AMI to use for the instance"
  type        = string
}

variable "instance_type" {
  description = "The type of instance to use"
  type        = string
  default     = "t2.micro"
}

variable "name" {
  description = "The name to tag the instance"
  type        = string
}
```
### outputs.tf
```bash
output "instance_id" {
  value = aws_instance.example.id
}
```
Using a Module in a Configuration
To use a module, reference it in your root module's configuration:

```bash
module "example_instance" {
  source       = "./path_to_module"
  ami          = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  name         = "example-instance"
}

output "instance_id" {
  value = module.example_instance.instance_id
}
```
## Source Types
### Modules can be sourced from different locations:
- Local Path: ./path_to_module
- GitHub: github.com/username/repo//path_to_module
- Terraform Registry: terraform-aws-modules/ec2-instance/aws

## Best Practices
### Use Versioning
- Pin Module Versions: When using modules from external sources, specify the version to ensure stability.
```bash
source  = "terraform-aws-modules/vpc/aws"
version = "2.44.0"
```
### Organize Code
- Modular Structure: Break down configurations into logical modules (e.g., network, compute, storage).
### Documentation
- README: Include a README.md in each module with usage instructions and examples.
- Variable Validation
- Validate Inputs: Use validation rules for variables to enforce constraints.
```bash
variable "instance_type" {
  type    = string
  default = "t2.micro"
  validation {
    condition     = contains(["t2.micro", "t3.micro"], var.instance_type)
    error_message = "Invalid instance type"
  }
}
```
### Outputs
- Useful Outputs: Define outputs for important values that users of the module will need.
- Example Module from Terraform Registry
- Using a module from the Terraform Registry:
```bash
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.44.0"

  name = "my-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["us-west-1a", "us-west-1b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.3.0/24", "10.0.4.0/24"]

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}
```
## Managing Modules
### Initialize and Update Modules
- terraform init: Initializes the working directory, downloading necessary modules.
```bash
terraform init
```
- terraform get: Manually downloads and updates modules.
```bash
terraform get
```
### Debugging Modules
- terraform plan: Review the plan to ensure the module behaves as expected.
```bash
terraform plan
```
- terraform apply: Apply changes and observe the output to verify module functionality.
```bash
terraform apply
```