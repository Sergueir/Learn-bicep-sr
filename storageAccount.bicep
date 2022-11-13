param location string = resourceGroup().location
param storageAccountName string = 'toylaunch${uniqueString(resourceGroup().id)}'

@description('')
resource storageAccount 'Microsoft.Storage/storageAccounts@2021-06-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
  }
}
resource virtualmachine 'Microsoft.ScVmm/virtualMachines@2020-06-05-preview' = {
  name: vm1
  location: 
  properties: {
  }
  extendedLocation: {
  }
}

