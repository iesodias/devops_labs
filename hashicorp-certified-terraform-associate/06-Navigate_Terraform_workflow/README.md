# 6 - Navigate Terraform Workflow
Understanding and navigating the Terraform workflow is essential for effectively managing infrastructure as code (IaC). The typical Terraform workflow involves several stages: writing configuration, initializing the project, planning, applying changes, and destroying infrastructure. Here’s a detailed breakdown of each stage:

## Write
### Writing Configuration
Configuration Files: Terraform configurations are written in HashiCorp Configuration Language (HCL) and stored in files with a .tf extension.
Structure: Define providers, resources, data sources, variables, and outputs.

```t
provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"

  tags = {
    Name = "example-instance"
  }
}

output "instance_id" {
  value = aws_instance.example.id
}
```

### Best Practices
- Modularization: Break configurations into reusable modules.
- Version Control: Store configuration files in a version control system (e.g., Git) to track changes and collaborate with others.

## Initialize
### Initializing the Project
- terraform init: Initializes the working directory containing the configuration files.
- Purpose: Downloads necessary provider plugins and sets up the backend configuration.
- Example:
```bash
terraform init
```
## Backend Configuration
### Local vs. Remote: By default, Terraform uses a local backend to store state files. For collaboration, use a remote backend (e.g., AWS S3, Terraform Cloud).
```t
backend "s3" {
  bucket = "my-terraform-state"
  key    = "path/to/my/key"
  region = "us-west-2"
}
```
## Plan
### Creating an Execution Plan
- terraform plan: Generates an execution plan, showing what actions Terraform will take to achieve the desired state defined in the configuration.
- Purpose: Allows you to review changes before applying them.
- Example:
```t
terraform plan
```
- Key Outputs
- Change Summary: Details what resources will be created, updated, or destroyed.
- Review: Carefully review the plan to ensure it matches your expectations.

## Apply
### Applying Changes
- terraform apply: Applies the changes required to reach the desired state of the configuration.
- Purpose: Executes the actions proposed in the plan to provision or update infrastructure.
- Example:
```bash
terraform apply
```
- Automated Approvals
- Auto-Approve: Use the -auto-approve flag to skip the approval prompt for automated workflows.
- Example:
```bash
terraform apply -auto-approve
```
## Destroy
### Destroying Infrastructure
- terraform destroy: Destroys the infrastructure managed by the configuration.
- Purpose: Clean up resources when they are no longer needed.
- Example:
```bash
terraform destroy
```
- Automated Destruction
- Auto-Approve: Use the -auto-approve flag to skip the approval prompt for automated cleanup.
- Example:
```bash
terraform destroy -auto-approve
```
## Additional Workflow Steps
### Managing State
- State Locking: Prevents concurrent operations from corrupting the state file. This is crucial when multiple team members work on the same infrastructure.
- Remote State: Storing state in a remote backend enables collaboration and disaster recovery.
- Managing Resources
- terraform refresh: Updates the state file with the real-world infrastructure state.
```bash
terraform refresh
```
- terraform taint: Marks a resource for recreation.
```bash
terraform taint aws_instance.example
```
- terraform untaint: Removes the "tainted" state from a resource.
```bash
terraform untaint aws_instance.example
```
## Using Workspaces
### Workspaces: Isolate different environments (e.g., dev, staging, production) within a single configuration.
- Commands:
- Create Workspace:
```bash
terraform workspace new dev
```
- Switch Workspace:
```bash
terraform workspace select dev
```
- List Workspaces:
```bash
terraform workspace list
```