# Lab: Setting Up Ansible and Executing a Simple Playbook

Objective:
In this lab, you will set up Ansible on your local machine, create two Ubuntu virtual machines (VMs) in Azure, and execute a simple Ansible playbook to ping those VMs.

## Prerequisites:

Azure CLI installed on your local machine
SSH key pair generated on your local machine

## Step 1: Log in to Azure
```bash
az login
```
## Step 2: Create a Resource Group in East US
```bash
az group create --name mdc-rg --location eastus
```
## Step 3: Generate SSH Key Pair
```bash
az sshkey create --name "mdc-key" --resource-group "mdc-rg"
```
Give permissions to the key
```bash
cd ~/.ssh/
ls -la
chmod 600 1704483110_1072772 #KEY_NAME_GENERATED
```
## Step 4: Create Virtual Machines - Make sure to change the key name to the correct one in the ~/.ssh directory.

```bash
# Virtual Machine 1
az vm create \
  --resource-group mdc-rg \
  --name mdc-01 \
  --image Ubuntu2204 \
  --admin-username azureuser \
  --ssh-key-values "$(cat ~/.ssh/1704484302_2513762.pub)"

# Virtual Machine 2
az vm create \
  --resource-group mdc-rg \
  --name mdc-02 \
  --image Ubuntu2204 \
  --admin-username azureuser \
  --ssh-key-values "$(cat ~/.ssh/1704484302_2513762.pub)"
```
## Step 5: Copy the Locally Generated Key to the Controller (mdc-01) - Make sure to change the key name to the correct one in the ~/.ssh directory.

```bash
scp -i ~/.ssh/1704484302_2513762 ~/.ssh/1704484302_2513762 azureuser@172.203.142.126:~/.ssh/ #COPY THE KEY TO MDC-01
ssh -i ~/.ssh/1704484302_2513762 azureuser@172.203.142.126
```
## Step 6: Create SSH Key File for Ansible

```bash
echo -e "mdc-target1 ansible_host=172.174.61.99 ansible_user=azureuser ansible_ssh_private_key_file=/home/azureuser/.ssh/1704484302_2513762" > inventory.txt
```

## Step 7: Install Ansible on Your MDC-01

```bash
sudo apt update
sudo apt install ansible
```
## Step 8: Test Connectivity

```bash
ansible mdc-target1 -i inventory.txt -m ping
```
## Step 8: Create Ansible Playbook
Create a file named playbook.yaml with the following content:

```bash
vi playbook.yaml
```

```yaml
---
- hosts: mdc-target1
  remote_user: azureuser
  tasks:
    - name: Ping the web servers
      ping:
```
## Step 9: Execute Ansible Playbook

```bash
ansible-playbook playbook.yaml -i inventory.txt
```

# Delete the resource group
```bash
az group delete --name mdc-rg --yes
```

This simple playbook will ping the specified VM, confirming the successful setup of Ansible and communication with the VM.

> 🚨 **Off-topic**: Hey there! If you're passionate about DevOps like I am and want to take your skills to the next level, I run a specialized DevOps mentorship. 🧠🛠 Dive deeper into the world of continuous integration, deployment, and best practices with me! 🚀 Oh, and for some cool tech content and behind-the-scenes, make sure to follow me on Instagram 📸 [@iesofdias](https://www.instagram.com/iesofdias/).
> ### 🌐 **Join the DevOps Mentorship!**
> Interested in taking your DevOps journey to the next level? Apply for the specialized mentorship now! [Apply for DevOps Mentorship](https://guilhermemaia.com/mentoria-devops).