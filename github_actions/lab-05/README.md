# GitHub Actions Lab - Create Azure Resource Group If It Doesn't Exist

## Step 1: Add the GitHub Actions Workflow

1. In your cloned `ga-lab-mdc` repository on your local machine, navigate to the `.github/workflows` directory.
2. Create a new file named `create_azure_rg_if_not_exists.yml`.
3. Open this file in your preferred text editor and paste the following GitHub Action workflow:

```yaml
name: Create Azure Resource Group If It Doesn't Exist

on:
  push:
    branches:
      - main

jobs:
  check-if-rg-exists:
    runs-on: ubuntu-latest
    steps:
    - name: '🔐 Azure Login'
      uses: azure/login@v1
      with:
        creds: ${{ secrets.AZURE_CREDENTIAL }}

    - name: Check if Resource Group exists
      id: checkrg
      run: |
        EXISTS=$(az group exists --name mdc-rg)
        echo "RG_EXISTS=$EXISTS" >> $GITHUB_ENV

    - name: Fail if Resource Group exists
      run: |
        if [ "$RG_EXISTS" == "true" ]; then
          echo "Resource group mdc-rg already exists."
          exit 1
        fi

  setup-and-create-rg:
    needs: check-if-rg-exists
    runs-on: ubuntu-latest
    steps:
    - name: Checkout code
      uses: actions/checkout@v2

    - name: '🔐 Azure Login'
      uses: azure/login@v1
      with:
        creds: ${{ secrets.AZURE_CREDENTIAL }}

    - name: Create Resource Group using Azure CLI
      run: |
        az group create --name mdc-rg --location eastus

    - name: Logout from Azure CLI
      run: |
        az logout
```

## Step 2: Commit and Push Changes to GitHub

1. Open your terminal or command prompt and navigate to the root of your `ga-lab-mdc` repository.
2. Add your changes:
   
```bash
git add .
```

3. Commit the changes:
   
```bash
git commit -m "Add workflow to create Azure Resource Group if it doesn't exist"
```

4. Push the changes:
   
```bash
git push origin main
```

## Step 3: Trigger the Workflow

1. To trigger the workflow, make any minor change in the repository, such as updating the README.
2. Push your changes. This will initiate the workflow.
3. Go to the `Actions` tab in your GitHub repository to monitor the workflow's progress.
4. Once the workflow finishes successfully, check your Azure portal. If the resource group didn't exist before, you should now see the newly created resource group `mdc-rg` in the `eastus` region.

**Note:** After pushing, your GitHub Action will trigger based on the defined events in the workflow file. Ensure you've added the correct Azure secrets to your GitHub repository as outlined in the previous lab.

> 🚨 **Off-topic**: Hey there! If you're passionate about DevOps like I am and want to take your skills to the next level, I run a specialized DevOps mentorship. 🧠🛠 Dive deeper into the world of continuous integration, deployment, and best practices with me! 🚀 Oh, and for some cool tech content and behind-the-scenes, make sure to follow me on Instagram 📸 [@iesofdias](https://www.instagram.com/iesofdias/).