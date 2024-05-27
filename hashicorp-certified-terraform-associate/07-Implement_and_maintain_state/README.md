# 7 - Implement and Maintain State
In Terraform, state refers to the information about the infrastructure being managed. It's a crucial aspect of Terraform's operation as it keeps track of what resources were created, their current configuration, and their relationships. Here's a detailed overview of implementing and maintaining state in Terraform:

## What is State?
### Definition
- State File: A JSON file that stores the current state of managed resources.
- Contains: IDs, attributes, and metadata of resources managed by Terraform.
- Purpose
- Track Resources: Keeps track of the infrastructure managed by Terraform.
- Synchronize: Enables Terraform to understand the relationship between configuration and real-world infrastructure.
## State Management
### Local State vs. Remote State
- Local State: Default behavior; stores state file on the local filesystem.
- Remote State: Stores the state file remotely in a shared location (e.g., AWS S3, Terraform Cloud).
- Benefits: Enables collaboration, locking, and state versioning.
## Implementing State
### Configuring Backend
- Define Backend: Specify the backend configuration in the root module's configuration file (backend.tf or within terraform block).
```bash
terraform {
  backend "s3" {
    bucket = "my-terraform-state"
    key    = "terraform.tfstate"
    region = "us-west-2"
  }
}
```
## Initializing Terraform
- terraform init: Initializes the working directory, configuring the backend.
```bash
terraform init
```
- Interacting with State
- Inspecting State
- terraform state list: Lists all resources in the state.
```bash
terraform state list
```
- terraform state show: Shows detailed information about a resource in the state.
```bash
terraform state show [resource]
```
## Modifying State
- terraform state mv: Moves resources in the state file.

```bash
terraform state mv [source] [destination]
```
- terraform state rm: Removes resources from the state file.

```bash
terraform state rm [resource]
```
## Remote State Commands
### terraform state pull: Retrieves the current state from the remote backend and outputs it to stdout.
```bash
terraform state pull
```
### terraform state push: Uploads a local state file to the remote backend.
```bash
terraform state push [path]
```
## Best Practices
### Backend Configuration
- Remote Backend: Use a remote backend for collaboration and state management.
- Locking: Enable locking to prevent concurrent operations from corrupting the state.
- State Versioning
    - Version Control: Store state file in a version control system for history tracking.
    - State Snapshots: Regularly capture snapshots of the state file for backup and recovery.
- State Security
    - Encryption: Ensure sensitive information in the state file is encrypted at rest.