# 01 Understand infrastructure as code (IaC) concepts

## Definition of IaC: Understand what Infrastructure as Code is and its benefits.
1. What is Infrastructure as Code (IaC)?
Infrastructure as Code (IaC) is an approach to managing and provisioning computing resources by automating infrastructure through definition files instead of manual configuration processes. These files can be versioned and maintained in the same way as any other software code, using software development practices.

## Benefits of IaC
1. Consistency
Elimination of Manual Configurations: Ensures that infrastructure is configured consistently every time, eliminating the variability that can occur with manual processes.
Repeatability: Enables the creation of identical environments with guaranteed consistency, essential for development, testing, and production environments.
2. Versioning
Change History: Each change to the infrastructure is recorded, allowing you to track modifications, revert to previous versions, and understand the history of changes.
Collaboration: Facilitates team collaboration since configurations can be shared and reviewed just like software code.
3. Automation
Efficiency: Automates the provisioning and configuration of infrastructure, reducing the time and effort needed to implement new environments or modify existing ones.
Fewer Manual Errors: Reduces the likelihood of human errors by eliminating the need for repetitive manual interventions.
4. Reduction of Manual Errors
Reusable Scripts: Uses pre-defined and tested scripts, minimizing the possibility of making errors during configuration.

## Types of IaC
1. Immutable
Definition: Immutable infrastructure means components are replaced instead of modified. Any update results in the creation of new resources, and the old ones are discarded.
Benefits: Greater stability, easy rollback, and consistency since changes do not alter existing resources.
2. Mutable
Definition: Mutable infrastructure allows modifications to existing resources instead of replacing them. Updates are applied directly to active resources.
Benefits: Can be more resource and time-efficient as it does not involve creating new resources for every change.

## Recommended Practices
1. Version Control
Using Git: Store your configuration files in a Git repository to track changes, collaborate with others, and maintain a history of modifications.
Branches and Pull Requests: Use branches for development and pull requests for code review before integration.
2. Code Review
Code Reviews: Conduct code reviews to ensure changes are analyzed by other team members, improving quality and detecting potential errors.
3. Linters and Validators: Use tools that check the syntax and quality of configuration code.s