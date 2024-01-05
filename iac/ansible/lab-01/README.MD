# Lab: Setting Up Ansible and Executing a Simple Playbook

Objective:
In this lab, you will set up Ansible on your local machine, create two Ubuntu virtual machines (VMs) in Azure, and execute a simple Ansible playbook to ping those VMs.

## Prerequisites:

Azure CLI installed on your local machine
SSH key pair generated on your local machine

Step 1: Log in to Azure
```bash
az login
```
Step 2: Generate SSH Key Pair
```bash
az sshkey create --name "mdc-key" --resource-group "mdc-rg"
```
Give permissions to the key
```bash
cd ~/.ssh/
chmod 600 1704483110_1072772 #KEY NAME GENERATED
```
Step 3: Create a Resource Group in East US
```bash
az group create --name mdc-rg --location eastus
```
Step 4: Create Virtual Machines

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
Step 5: Copy the Locally Generated Key to the Controller (mdc-01)

```bash
scp -i ~/.ssh/1704484302_2513762 ~/.ssh/1704484302_2513762 azureuser@20.124.99.46:~/.ssh/ #COPY THE KEY TO MDC-01
ssh -i ~/.ssh/1704484302_2513762 azureuser@172.191.45.243
```
Step 6: Create SSH Key File for Ansible

```bash
echo -e "mdc-target1 ansible_host=172.191.45.243 ansible_user=azureuser ansible_ssh_private_key_file=/home/azureuser/.ssh/1704484302_2513762" > inventory.txt
```
Step 7: Test Connectivity

```bash
ansible mdc-target1 -i inventory.txt -m ping
```
Step 8: Create Ansible Playbook
Create a file named playbook.yaml with the following content:

```yaml
---
- hosts: mdc-target1
  remote_user: azureuser
  tasks:
    - name: Ping the web servers
      ping:
```
Step 9: Execute Ansible Playbook

```bash
ansible-playbook playbook.yaml -i inventory.txt
```

# Delete VMs
```bash
az vm delete --resource-group mdc-rg --name mdc-01-controller --yes
az vm delete --resource-group mdc-rg --name mdc-02-worker --yes
```
# Delete the resource group
```bash
az group delete --name mdc-rg --yes
```

This simple playbook will ping the specified VM, confirming the successful setup of Ansible and communication with the VM.
