// Shared Parameters
param environmentType string
param resourcePrefix string //TODO rethink parameter
param location string = resourceGroup().location

// KeyVault Parameters
param enabledForTemplateDeployment bool = true
param enabledForDeployment bool = false

// PE Parameters
param vnetName string
param subnetName string

resource vault 'Microsoft.KeyVault/vaults@2022-07-01' = {
    name: 'kv-${resourcePrefix}-${environmentType}'
    location: location
    properties: {
        accessPolicies: [
        ] //enableRbacAuthorization is enabled so access policy will be assigned via PS or CLI
        enabledForDeployment: enabledForDeployment
        enabledForDiskEncryption: false //only needed for key vault that will be used as part of IaaS disk encryption (ADE)
        enabledForTemplateDeployment: enabledForTemplateDeployment
        enablePurgeProtection: true
        enableRbacAuthorization: true //azure rbac allows you to centrally manage access instead of per kv
        networkAcls: {
          defaultAction: 'deny'
          bypass: 'AzureServices'
        }
        publicNetworkAccess:'disabled'
        sku: {
            name: 'standard'
            family: 'A'
        }
        tenantId: subscription().tenantId
    }
}

// retrieve subnetID programatically 
resource existingVnet 'Microsoft.Network/virtualNetworks@2019-11-01' existing= {
  name: vnetName
}

resource existingSubNetwork 'Microsoft.Network/virtualNetworks/subnets@2022-07-01' existing = {
  name: subnetName
  parent: existingVnet
}

var keyvaultPeName = 'kv-${resourcePrefix}-${environmentType}-pe'
resource keyVaultPrivateEndpoint 'Microsoft.Network/privateEndpoints@2022-07-01' = {
  name: keyvaultPeName
  location: location
 // tags: tags
  properties: {
    privateLinkServiceConnections: [
      {
        name: keyvaultPeName
        properties: {
          groupIds: [
            'vault'
          ]
          privateLinkServiceId: vault.id
        }
      }
    ]
    subnet: {
      id: existingSubNetwork.id
    }
  }
}
