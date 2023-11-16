# Lab: Creating Azure Resource Groups with Bash Functions

## Prerequisites:
- Azure CLI installed and configured on your system.
- Logged in to your Azure account through Azure CLI.

## Step 1: Create a Directory for the Lab

Create a dedicated directory for the lab and navigate to it:

```bash
mkdir azure-resource-group-lab
cd azure-resource-group-lab
```

## Step 2: Azure Login

Ensure you are logged in to your Azure account:

```bash
az login
```

## Step 3: Create the Function

Create a file named `resource_group_functions.sh`:

```bash
touch resource_group_functions.sh
```

Open `resource_group_functions.sh` and add the following function:

```bash
create_resource_group() {
    if [ $# -lt 2 ]; then
        echo "Usage: create_resource_group [resource group name] [location]"
        echo "Example: create_resource_group MyResourceGroup eastus"
        return 1
    fi
    az group create --name $1 --location $2
}
```

## Step 4: Source the Functions File

Source the functions file to make the function available in your session:

```bash
source resource_group_functions.sh
```

## Step 5: Test the Function

Test creating a resource group with the function:

```bash
create_resource_group mdc-rg eastus
```

---

> 🚨 **Off-topic**: Hey there! If you're passionate about DevOps like I am and want to take your skills to the next level, I run a specialized DevOps mentorship. 🧠🛠 Dive deeper into the world of continuous integration, deployment, and best practices with me! 🚀 Oh, and for some cool tech content and behind-the-scenes, make sure to follow me on Instagram 📸 [@iesofdias](https://www.instagram.com/iesofdias/).
> ### 🌐 **Join the DevOps Mentorship!**
> Interested in taking your DevOps journey to the next level? Apply for the specialized mentorship now! [Apply for DevOps Mentorship](https://guilhermemaia.com/mentoria-devops).
