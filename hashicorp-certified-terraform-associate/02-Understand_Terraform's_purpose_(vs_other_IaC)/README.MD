# 02 - Understand Terraform's purpose (vs other IaC)

## Terraform's Purpose
Terraform is an open-source tool created by HashiCorp designed to define, provision, and manage infrastructure across various cloud providers and services using a declarative configuration language. The primary purpose of Terraform is to enable infrastructure as code (IaC), providing a consistent workflow for managing and provisioning resources.

## Key Features:
1. Declarative Configuration: Terraform uses a declarative language (HCL - HashiCorp Configuration Language) to describe the desired state of infrastructure. This means you define what you want, and Terraform figures out how to achieve it.
2. Multi-Cloud and Provider Agnostic: Terraform supports multiple providers such as AWS, Azure, Google Cloud, Kubernetes, and many others. This allows for managing resources across different clouds and services from a single tool.
3. Infrastructure Provisioning: Terraform can create, update, and delete infrastructure resources like virtual machines, storage, and networking components.
4. State Management: Terraform maintains a state file to keep track of the resources it manages. This allows it to determine what changes need to be made to align the real-world infrastructure with the desired configuration.
5. Plan and Apply: Terraform can generate an execution plan (using terraform plan) showing what changes it will make, allowing you to review before applying them (using terraform apply).
Comparison with Other IaC Tools
To understand Terraform's unique value, it is helpful to compare it with other popular IaC tools:

## Terraform vs. AWS CloudFormation
### Scope:
1. Terraform: Multi-cloud and provider agnostic. Can manage infrastructure across various cloud providers and on-premises environments.
2. CloudFormation: AWS-specific. Primarily used to manage AWS resources.
### Language:
1. Terraform: Uses HashiCorp Configuration Language (HCL), which is designed to be human-readable and supports complex resource dependencies.
2. CloudFormation: Uses JSON or YAML. While powerful, it can become complex and harder to manage for large configurations.
### Portability:
- Terraform: High portability across different cloud providers, making it ideal for hybrid and multi-cloud strategies.
- CloudFormation: Limited to AWS, with no support for managing resources outside of AWS.
### Terraform vs. Ansible/Chef/Puppet
- Primary Use Case:
    - Terraform: Primarily focused on infrastructure provisioning. It defines and provisions the underlying infrastructure components.
    - Ansible/Chef/Puppet: Primarily focused on configuration management. These tools manage software and services on existing infrastructure, ensuring they are configured correctly.
### Language:
- Terraform: Uses a declarative approach (HCL), where you describe the desired state, and Terraform handles the creation and modification of resources.
- Ansible: Uses YAML to define playbooks in a procedural manner.
- Chef: Uses Ruby-based DSL (domain-specific language) for writing recipes.
- Puppet: Uses its own declarative language to define desired configurations.
### Execution Model:
- Terraform: Desired state approach with a focus on idempotence. Ensures that applying the same configuration repeatedly yields the same result.
- Ansible/Chef/Puppet: Often use a push-based model where configurations are pushed to servers, or pull-based where agents on servers pull configurations.
### Benefits of Using Terraform
1. Consistency: Ensures that infrastructure is provisioned in a consistent and repeatable manner, reducing human error and discrepancies.
2. Collaboration: Configuration files can be stored in version control systems (e.g., Git), enabling collaboration among team members and maintaining a history of changes.
3. Scalability: Manages infrastructure at scale, automating the provisioning of large numbers of resources efficiently.
4. Automation: Automates the entire lifecycle of infrastructure management, from provisioning and configuration to updates and teardown.
5. Community and Ecosystem: Strong community support and a rich ecosystem of providers and modules that extend Terraform's capabilities.
### Common Use Cases for Terraform
1. Multi-Cloud Management: Manage resources across multiple cloud providers from a single configuration file.
2. Infrastructure Provisioning: Automate the provisioning of infrastructure components such as VMs, networks, and storage.
3. Infrastructure as Code: Implement IaC practices to ensure infrastructure is defined and managed through code, enabling better versioning and reproducibility.
4. Deployment Automation: Integrate with CI/CD pipelines to automate the deployment of infrastructure as part of the software delivery process.
5. Disaster Recovery: Quickly recreate infrastructure in the event of a failure by applying the same configuration files.
