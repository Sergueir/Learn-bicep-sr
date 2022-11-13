@description(PS - to deploy - New-AzResourceGroupDeployment -ResourceGroupName dev -TemplateFile ./keyvault.bicep -Mode Incremental -Verbose)
@description(objectid is user object id from Azure AD)
param location string =resourceGroup().location
param tenantid string = 'afasfsdasdasda'
param objectid string = adsffsdfasdfasdfasdf

resource kv 'Microsoft.KeyVault/vaults@2022-07-01' = {
  name: kv01
  location: location
  properties: {
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
