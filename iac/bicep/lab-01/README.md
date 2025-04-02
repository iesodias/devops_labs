# 🚀 Lab: Creating a Virtual Machine in Azure with Bicep

This lab will guide you through creating a Linux virtual machine using Bicep

---

## 🧱 Prerequisites

- Azure account ([Azure Portal](https://portal.azure.com))
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli) installed
- [Bicep extension](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/install) installed
- Logged in to Azure with `az login`

---

## 🗂️ Project structure

```
vm-bicep-lab/
├── main.bicep
└── README.md
```

---

## 📝 Bicep Code (`main.bicep`)

```bicep
@description('Virtual Machine Name')
param vmName string = 'vmLinuxPasswordDemo'

@description('Location')
param location string = resourceGroup().location

@description('VM Size')
param vmSize string = 'Standard_B1s'

@description('Admin username')
param adminUsername string = 'azureuser'

@secure()
@description('Admin password')
param adminPassword string

var vnetName = '${vmName}-vnet'
var subnetName = '${vmName}-subnet'
var nicName = '${vmName}-nic'
var ipName = '${vmName}-ip'
var nsgName = '${vmName}-nsg'

resource nsg 'Microsoft.Network/networkSecurityGroups@2023-05-01' = {
  name: nsgName
  location: location
  properties: {
    securityRules: [
      {
        name: 'Allow-SSH'
        properties: {
          priority: 1000
          direction: 'Inbound'
          access: 'Allow'
          protocol: 'Tcp'
          sourcePortRange: '*'
          destinationPortRange: '22'
          sourceAddressPrefix: '*'
          destinationAddressPrefix: '*'
        }
      }
    ]
  }
}

resource vnet 'Microsoft.Network/virtualNetworks@2023-05-01' = {
  name: vnetName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: ['10.0.0.0/16']
    }
    subnets: [
      {
        name: subnetName
        properties: {
          addressPrefix: '10.0.0.0/24'
          networkSecurityGroup: {
            id: nsg.id
          }
        }
      }
    ]
  }
}

resource publicIP 'Microsoft.Network/publicIPAddresses@2023-05-01' = {
  name: ipName
  location: location
  sku: {
    name: 'Basic'
  }
  properties: {
    publicIPAllocationMethod: 'Static'
  }
}

resource nic 'Microsoft.Network/networkInterfaces@2023-05-01' = {
  name: nicName
  location: location
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig1'
        properties: {
          subnet: {
            id: vnet.properties.subnets[0].id
          }
          privateIPAllocationMethod: 'Dynamic'
          publicIPAddress: {
            id: publicIP.id
          }
        }
      }
    ]
  }
}

resource vm 'Microsoft.Compute/virtualMachines@2023-03-01' = {
  name: vmName
  location: location
  properties: {
    hardwareProfile: {
      vmSize: vmSize
    }
    osProfile: {
      computerName: vmName
      adminUsername: adminUsername
      adminPassword: adminPassword
      linuxConfiguration: {
        disablePasswordAuthentication: false
      }
    }
    storageProfile: {
      imageReference: {
        publisher: 'Canonical'
        offer: 'UbuntuServer'
        sku: '19_04-daily-gen2'
        version: '19.04.201910080'
      }
      osDisk: {
        createOption: 'FromImage'
        managedDisk: {
          storageAccountType: 'Standard_LRS'
        }
      }
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: nic.id
        }
      ]
    }
  }
}

output vmName string = vm.name
output adminUsername string = adminUsername
output publicIP string = publicIP.properties.ipAddress
output sshCommand string = 'ssh ${adminUsername}@${publicIP.properties.ipAddress}'
```

---

## ⚙️ Deploy with Azure CLI

```bash
# Create the resource group
az group create --name bicep-rg --location eastus

# Deploy the infrastructure
az deployment group create \
  --resource-group bicep-rg \
  --template-file main.bicep
```

---

## 📡 Access the Virtual Machine

```bash
# Copy the public IP from the output and run the SSH command
ssh azureuser@<public-ip>
```

---

## ✅ Clean up resources (optional)

```bash
az group delete --name bicep-rg --yes --no-wait
```

---

## 📁 References

- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Bicep Templates on GitHub](https://github.com/Azure/bicep)

