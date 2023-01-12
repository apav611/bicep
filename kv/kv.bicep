param environmentType string
param resourcePrefix string
param location string = resourceGroup().location
param subnetid string
param accessObjectId1 string //more specific name could provide insight and help with documentation
param accessObjectId2 string //more specific name could provide insight and help with documentation

resource vault 'Microsoft.KeyVault/vaults@2022-07-01' = {
    name: 'kv-${resourcePrefix}-${environmentType}'
    location: location
    properties: {
        accessPolicies: [
            {
                tenantId: subscription().tenantId
                objectId: accessObjectId1
                permissions: {
                    certificates: [ 'all' ]
                    secrets: [ 'all' ]
                    keys: [ 'all' ]
                    storage: [ 'all' ]
                }
            }
            {
                tenantId: subscription().tenantId
                objectId: accessObjectId2
                permissions: {
                    certificates: [ 'all' ]
                    secrets: [ 'all' ]
                    keys: [ 'all' ]
                    storage: [ 'all' ]
                }
            }
        ]
        enableRbacAuthorization: true //azure rbac allows you to centrally manage access instead of per kv
        enableSoftDelete: true
        enabledForDeployment: true
        enabledForDiskEncryption: false //only needed for key vault that will be used as part of IaaS disk encryption (ADE)
        enabledForTemplateDeployment: true
        enablePurgeProtection: true
        tenantId: subscription().tenantId
        sku: {
            name: 'standard'
            family: 'A'
        }
        networkAcls: {
            defaultAction: 'Deny'
            bypass: 'AzureServices'
        }
    }
}
var keyvaultPleName = 'kv-${resourcePrefix}-${environmentType}-pe'
resource keyVaultPrivateEndpoint 'Microsoft.Network/privateEndpoints@2022-07-01' = {
  name: keyvaultPleName
  location: location
 // tags: tags
  properties: {
    privateLinkServiceConnections: [
      {
        name: keyvaultPleName
        properties: {
          groupIds: [
            'vault'
          ]
          privateLinkServiceId: vault.id
        }
      }
    ]
    subnet: {
      id: subnetid
    }
  }
}
