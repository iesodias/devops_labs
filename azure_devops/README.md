# Lab: Creating a Repository in Azure DevOps

## Step 1: Create a Repository on Azure Devops

1. Log in to your Azure DevOps account.
2. Navigate to the project where you want to create the repository.
3. Click on the "Repos" tab in the top navigation menu.
4. On the Repositories page, click on the "New repository" button.
5. In the "Create a new repository" dialog, enter "mdc-pipelines-live" as the name for the repository.
6. Optionally, add a description for the repository to provide more context.
7. Choose the version control system you want to use (Git or Team Foundation Version Control).
8. Click on the "Create" button to create the repository.
9. Once the repository is created, clone it to your local machine using the provided Git URL.
10. Open a terminal or Git Bash on your local machine.
11. Navigate to the directory where you want to clone the repository using the `cd` command.
12. Clone the repository using the following command:
    ```
    git clone <repository_url>
    ```
    Replace `<repository_url>` with the Git URL of your newly created repository.
13. You now have a local copy of the "mdc-pipelines-live" repository on your machine, and you can start working on it by adding files, committing changes, and pushing them to the remote repository on Azure DevOps.

## Step 2: Cloning and Copying Contents to Azure DevOps Repository

## Clone the GitHub Repository

1. Open your terminal or command prompt.

2. Navigate to the directory where you want to clone the repository and copy its contents. Use the `cd` command to navigate to the appropriate directory. For example:
```bash
cd Projects
```
3. Clone the `devops_react_app` repository from GitHub using the `git clone` command. This will create a folder named `devops_react_app` with all the contents of the repository inside it. Run the following command:
```bash
git clone https://github.com/iesodias/devops_react_app
```
4. Navigate into the `devops_react_app` folder created after cloning:
```bash
cd devops_react_app
```
5. Navigate to the directory where the source folder (devops_react_app) is located. Use the cd command to navigate to the appropriate directory. For example:
```bash
cp -r ./* /path/to/mdc-pipelines-live/
```
6. Replace /path/to/mdc-pipelines-live/ with the actual path to the target folder where you want to move the contents.

## Step 3: Cloning and Copying Contents to Azure DevOps Repository

1. Open your terminal or command prompt on your operating system.
2. Navigate to the directory where you cloned the mdc-pipelines-live repository. For example:
```bash
touch azure-pipelines.yaml
```
3. Open the azure-pipelines.yaml file with your preferred text editor. You can use commands like nano, vim, code, or the text editor you usually use. For example, to open with Visual Studio Code:
```
code azure-pipelines.yaml
```
4. Copy and paste the following content into the azure-pipelines.yaml file:
```yaml
# Define the trigger to automatically run the pipeline on changes in the main branch
trigger:
  branches:
    include:
      - main

# Define the agent pool where the pipeline will run
pool:
  vmImage: 'ubuntu-latest'

# Define the pipeline steps
steps:
  - script: echo Hello World
    displayName: 'Print Hello World'
Save the file after making any necessary modifications.
Now you have successfully created the azure-pipelines.yaml file in the mdc-pipelines-live directory and set up a basic pipeline that will print "Hello World". You can continue to edit the azure-pipelines.yaml file to add more steps and customize the pipeline as needed for your project.
```
## Step 4: Guide to create the infrastructure 

1. Create a Resource Group in Azure
Open the Azure CLI and run the following command to create a resource group:
```bash
az group create --name mdc-rg --location <region>
```
Replace <region> with the desired region (e.g., centralus).
2. Create an App Service Plan
Use the Azure CLI to create an App Service Plan within the resource group:
```bash
az appservice plan create --name mdc-sp --resource-group mdc-rg --sku F1 --is-linux
```
3. Set Up Docker Hub Connection (Optional)
- If you're using Docker Hub, configure the connection in the Azure portal or Azure CLI.
4. Create an App Service for Your Application
Deploy your application to an App Service within the resource group:
```bash
az webapp create --resource-group mdc-rg --plan mdc-sp --name react-webappid --deployment-container-image-name docker.io/iesodias/mdc-react-app:987
```
- Replace docker.io/iesodias/mdc-react-app:987 with your Docker Hub image and tag.
5. Configure Deployment Pipeline in Azure DevOps (Optional)
- If you're using Azure DevOps for deployment, set up a deployment pipeline using appropriate tasks.

## Step 5: How to build a cointainer

1. Access Azure DevOps
2. Open your browser and go to the Azure DevOps portal at dev.azure.com.
3. Select the Project
4. Choose the project where you want to create the pipeline or create a new project if needed.
5. Create a New Pipeline
6. From the left-hand side menu, click on "Pipelines" and then "New Pipeline."
7. Choose the Repository
8. Select the repository where your source code is located. This can be GitHub, Azure Repos Git, Bitbucket, etc.
9. Configure the Trigger
10. In the pipeline editor, paste the provided YAML code as an example. It defines a trigger to automatically run the pipeline when there are changes in the main branch.
```yaml
# Define o gatilho para executar automaticamente a pipeline em alterações no branch principal
trigger:
  branches:
    include:
      - main
```
11. Define the Agent Pool
12. In the pool section, the YAML specifies that the pipeline will run on an Ubuntu agent. Ensure this meets your project's requirements.
```bash
# Define o pool de agentes onde a pipeline será executada
pool:
  vmImage: 'ubuntu-latest'
```
13. Configure the Pipeline Steps
14. In the provided YAML example, the pipeline uses the Docker@2 task to build and push the Docker image to a registry. You'll need to configure specific details such as the container registry, repository, Dockerfile, and other settings as needed.
```yaml
# Define as etapas da pipeline
steps:
- task: Docker@2
  inputs:
    containerRegistry: 'registry'
    repository: 'iesodias/mdc-react-app'
    command: 'buildAndPush'
    Dockerfile: '**/dockerfile'
    addPipelineData: false
    addBaseImageData: false
```
15. Save and Run the Pipeline
16. After setting up all the necessary steps, click on "Save" to save the pipeline. Then click on "Run" to execute it manually or wait for the next change in the main branch to trigger the pipeline automatically.

## Step 6: How to deploy our app

1. Access Azure DevOps
2. Open your browser and navigate to the Azure DevOps portal at dev.azure.com.
3. Select the Project
4. Choose the project where you have created the pipeline or create a new one if necessary.
5. Edit the Existing Pipeline
6. Go to the Pipelines section in your project and select the pipeline where you want to add the AzureRmWebAppDeployment task.
7. Click on "Edit" or "Edit Pipeline" to modify the pipeline configuration.
8. Add the AzureRmWebAppDeployment Task
9. Within the pipeline editor, locate the section where you define the pipeline steps.
10. Add the AzureRmWebAppDeployment task with the following inputs:

```yaml
- task: AzureRmWebAppDeployment@4
  inputs:
    ConnectionType: 'AzureRM'
    azureSubscription: 'AzureRM'
    appType: 'webAppContainer'
    WebAppName: 'react-webappid'
    DockerNamespace: 'docker.io'
    DockerRepository: 'iesodias/mdc-react-app:$(Build.BuildId)'
```

11. Replace <YourAzureSubscription> with the name or ID of your Azure subscription.
12. Save and Run the Pipeline
13. After adding the task, click on "Save" to save the changes to your pipeline configuration.
14. Run the pipeline either manually or wait for the trigger event (e.g., code commit) to automatically trigger the pipeline.

