//@description('PS - to deploy - New-AzResourceGroupDeployment -ResourceGroupName dev -TemplateFile ./keyvault.bicep -Mode Incremental -Verbose)
//@description(objectid is user object id from Azure AD')
param kvname string = kv01
param location string = resourceGroup().location
param tenantid string = 'afasfsdasdasda'
param objectid string = adsffsdfasdfasdfasdf

@secure()
param pass  string

resource kv 'Microsoft.KeyVault/vaults@2022-07-01' = {
  name: kvname
  location: location
  properties: {
    networkAcls:  {
      bypass: 'AzureServices'
      defaultAction: 'Deny'
      ipRules: [
      {
        value: '10.10.24.2/24'
      }
      ]
    }
    sku: {
      family: 'A'
      name: 'standard'
    }
    tenantId: tenantid
    accessPolicies: [
      {
        objectId: objectid
        permissions: {
            secrets:[
              'get'
              'set'
              'list'
            ]
        }
        tenantId: tenantid
      }
      {
        objectId: objectid
        permissions: {[
          certificates:[
            'all'
          ]
        ]
        }
        tenantId: tenantid
      }
      {
        objectId: objectid
        permissions: {[
          keys:[
            'create'
            'delete'
            'get'
          ]
        ]
        }
        tenantId: tenantid
      }
    ]
  }
}
resource secret1 'Microsoft.KeyVault/vaults/secrets@2022-07-01' = {
  parent: kv
  name: adminpass
  properties: {
    value: 'pass'
  }
}