# 4 - Use the Terraform CLI (Outside of Core Workflow)
The Terraform Command Line Interface (CLI) offers a range of commands beyond the core workflow of init, plan, apply, and destroy. These additional commands help with formatting, validating, managing state, importing resources, and more. Here’s a detailed look at the essential Terraform CLI commands outside of the core workflow:

## Formatting Configuration Files
### terraform fmt:
- Purpose: Automatically formats Terraform configuration files to follow a canonical format and style.
- Usage: This helps ensure consistent code formatting, making it easier to read and maintain.
- Example:
```bash
terraform fmt
```
## Validating Configuration Files
### terraform validate:
- Purpose: Validates the configuration files for syntax errors and internal consistency without connecting to any infrastructure provider.
- Usage: Helps catch syntax errors and basic configuration issues before running more involved commands like plan or apply.
- Example:
```bash
terraform validate
```
## Managing the State
### terraform state:
- Purpose: Provides commands to inspect, manipulate, and manage the Terraform state.
- Subcommands:
- list: Lists all resources in the state.
```bash
terraform state list
```
- show: Shows detailed information about a resource in the state.
```bash
terraform state show [resource]
```
- mv: Moves resources in the state file.
```bash
terraform state mv [source] [destination]
```
- rm: Removes resources from the state file.
```bash
terraform state rm [resource]
```
- pull: Retrieves the state from the remote backend and outputs it to stdout.
```bash
terraform state pull
```
- push: Uploads a local state file to the remote backend.
```bash
terraform state push [path]
```
## Importing Existing Resources
### terraform import:
- Purpose: Imports existing infrastructure into Terraform's state so that it can be managed by Terraform.
- Usage: Useful for bringing resources created outside of Terraform under its management without recreating them.
- Example:
```bash
terraform import aws_instance.example i-1234567890abcdef0
```
## Generating and Managing Graphs
### terraform graph:
- Purpose: Generates a visual representation of the Terraform dependency graph.
- Usage: Helps understand the dependencies and relationships between resources.
- Example:
```bash
terraform graph | dot -Tpng > graph.png
```
## Debugging and Logging
### terraform debug:
- Purpose: Provides detailed debug output to help diagnose issues with configurations and operations.
- Usage: Useful for troubleshooting errors during Terraform runs.
- Example:
```bash
terraform apply -debug
```
## Workspaces
### terraform workspace:
- Purpose: Manages multiple workspaces, allowing for separate states for different environments (e.g., development, staging, production) within a single configuration.
- Subcommands:
- new: Creates a new workspace.
```bash
terraform workspace new [name]
```
- select: Switches to a different workspace.
```bash
terraform workspace select [name]
```
- list: Lists all existing workspaces.
```bash
terraform workspace list
```
- delete: Deletes a workspace.
```bash
terraform workspace delete [name]
```
## Interpolating Configuration Values
### terraform console:
- Purpose: Opens an interactive console for evaluating expressions and interpolations within the Terraform configuration.
- Usage: Useful for testing and debugging expressions.
- Example:
```bash
terraform console
```
## Changing Resource Attributes
### terraform taint:

- Purpose: Marks a resource for recreation on the next apply command.
- Usage: Used to force Terraform to destroy and recreate a resource.
- Example:
```bash
terraform taint aws_instance.example
```
### terraform untaint:

- Purpose: Removes the "tainted" state from a resource, so it is not recreated on the next apply.
- Usage: Used to cancel the taint operation if it was applied by mistake.
- Example:
```bash
terraform untaint aws_instance.example
```
## Provider Configuration
### terraform providers:
- Purpose: Lists the providers required by the configuration and their current versions.
- Usage: Helps ensure all necessary providers are configured correctly.
- Example:
```bash
terraform providers
```
## Resource Targeting
### terraform apply with -target:
- Purpose: Applies changes only to the specified resource(s) or module(s).
- Usage: Useful for limiting the scope of changes during apply operations.
- Example:
```bash
terraform apply -target=aws_instance.example
```