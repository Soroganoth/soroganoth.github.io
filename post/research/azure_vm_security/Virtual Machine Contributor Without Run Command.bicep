targetScope = 'subscription'

@description('Array of actions for the roleDefinition')
param actions array = [
                      'Microsoft.Authorization/*/read'
                    'Microsoft.Compute/availabilitySets/*'
                    'Microsoft.Compute/locations/*'
                    'Microsoft.Compute/virtualMachines/*'
                    'Microsoft.Compute/virtualMachineScaleSets/*'
                    'Microsoft.Compute/cloudServices/*'
                    'Microsoft.Compute/disks/write'
                    'Microsoft.Compute/disks/read'
                    'Microsoft.Compute/disks/delete'
                    'Microsoft.DevTestLab/schedules/*'
                    'Microsoft.Insights/alertRules/*'
                    'Microsoft.Network/applicationGateways/backendAddressPools/join/action'
                    'Microsoft.Network/loadBalancers/backendAddressPools/join/action'
                    'Microsoft.Network/loadBalancers/inboundNatPools/join/action'
                    'Microsoft.Network/loadBalancers/inboundNatRules/join/action'
                    'Microsoft.Network/loadBalancers/probes/join/action'
                    'Microsoft.Network/loadBalancers/read'
                    'Microsoft.Network/locations/*'
                    'Microsoft.Network/networkInterfaces/*'
                    'Microsoft.Network/networkSecurityGroups/join/action'
                    'Microsoft.Network/networkSecurityGroups/read'
                    'Microsoft.Network/publicIPAddresses/join/action'
                    'Microsoft.Network/publicIPAddresses/read'
                    'Microsoft.Network/virtualNetworks/read'
                    'Microsoft.Network/virtualNetworks/subnets/join/action'
                    'Microsoft.RecoveryServices/locations/*'
                    'Microsoft.RecoveryServices/Vaults/backupFabrics/backupProtectionIntent/write'
                    'Microsoft.RecoveryServices/Vaults/backupFabrics/protectionContainers/protectedItems/*/read'
                    'Microsoft.RecoveryServices/Vaults/backupFabrics/protectionContainers/protectedItems/read'
                    'Microsoft.RecoveryServices/Vaults/backupFabrics/protectionContainers/protectedItems/write'
                    'Microsoft.RecoveryServices/Vaults/backupPolicies/read'
                    'Microsoft.RecoveryServices/Vaults/backupPolicies/write'
                    'Microsoft.RecoveryServices/Vaults/read'
                    'Microsoft.RecoveryServices/Vaults/usages/read'
                    'Microsoft.RecoveryServices/Vaults/write'
                    'Microsoft.ResourceHealth/availabilityStatuses/read'
                    'Microsoft.Resources/deployments/*'
                    'Microsoft.Resources/subscriptions/resourceGroups/read'
                    'Microsoft.SerialConsole/serialPorts/connect/action'
                    'Microsoft.SqlVirtualMachine/*'
                    'Microsoft.Storage/storageAccounts/listKeys/action'
                    'Microsoft.Storage/storageAccounts/read'
                    'Microsoft.Support/*'
]

@description('Array of notActions for the roleDefinition')
param notActions array = [
'Microsoft.Compute/virtualMachines/runCommand/action'
'Microsoft.Compute/virtualMachines/runCommands/read'
'Microsoft.Compute/virtualMachines/runCommands/write'
'Microsoft.Compute/virtualMachines/runCommands/delete'
]

@description('Friendly name of the role definition')
param roleName string = 'Virtual Machine Contributor Without Run Command'

@description('Detailed description of the role definition')
param roleDescription string = 'Virtual Machine Contributor without the permissions to create or run Run Commands on VMs'

var roleDefName = guid(subscription().id, string(actions), string(notActions))

resource roleDef 'Microsoft.Authorization/roleDefinitions@2022-04-01' = {
  name: roleDefName
  properties: {
    roleName: roleName
    description: roleDescription
    type: 'customRole'
    permissions: [
      {
        actions: actions
        notActions: notActions
      }
    ]
    assignableScopes: [
      subscription().id
    ]
  }
}
