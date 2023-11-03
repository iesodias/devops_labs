# GitHub Actions Lab - Integrating Azure Credentials

## Step 1: Set Up Azure Credentials in CloudShell

1. Log in to your [Azure Portal](https://portal.azure.com/).
2. Open **cloudshell**.
3. Run the Azure CLI command to create the service principal:

    ```bash
    az ad sp create-for-rbac --name "mdcgithubactions" --role contributor --scopes /subscriptions/SUBSCRIPTION_ID --sdk-auth
    ```

🚨 **Note**: Replace `SUBSCRIPTION_ID` with your actual Azure subscription ID.

4. Upon successful execution, you will receive a JSON output containing the Azure credentials:

    ```json
    {
      "clientId": "...",
      "clientSecret": "...",
      ...
    }
    ```

---

## Step 2: Set Secrets in GitHub Actions

1. Navigate to your GitHub repository `ga-lab-mdc`.
2. Go to `Settings` > `Security` > `Secrets and Variables` > `Actions`.
3. Click on `New repository secret`.
4. Create a secret named `AZURE_CREDENTIALS` and paste the entire JSON output you received in Step 1.

---

## Step 3: Integrate Azure with Your GitHub Action

1. Now that you have set the secret, you can access it in your GitHub Actions workflow using the following:

    ```yaml
    env:
      AZURE_CREDENTIAL: ${{ secrets.AZURE_CREDENTIALS }}
    ```

2. This environment variable can now be used in your workflow to authenticate and interact with Azure services.

---

**Note**: Always ensure that you're storing sensitive data like credentials securely, using features such as GitHub Secrets. Exposure of such information can lead to potential misuse.

Remember, this is just a basic example. In real-world scenarios, you would use specific commands and scripts tailored to each stage of your CI/CD pipeline.

> 🚨 **Off-topic**: Hey there! If you're passionate about DevOps like I am and want to take your skills to the next level, I run a specialized DevOps mentorship. 🧠🛠 Dive deeper into the world of continuous integration, deployment, and best practices with me! 🚀 Oh, and for some cool tech content and behind-the-scenes, make sure to follow me on Instagram 📸 [@iesofdias](https://www.instagram.com/iesofdias/).
> ### 🌐 **Join the DevOps Mentorship!**
> Interested in taking your DevOps journey to the next level? Apply for the specialized mentorship now! [Apply for DevOps Mentorship](https://guilhermemaia.com/mentoria-devops).