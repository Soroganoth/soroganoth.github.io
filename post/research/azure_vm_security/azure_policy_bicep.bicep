param scope string
param policyDefName string = 'Disallow Virtual Machine Contributor roles'

resource symbolicname 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: policyDefName
  scope: scope
  properties: {
    description: 'string'
    displayName: 'string'
    metadata: any()
    mode: 'string'
    parameters: {}
    policyRule: { if: {
        allOf: [
          {
            field: 'type'
            equals: 'Microsoft.Authorization/roleAssignments'
          }
          {

            field: 'Microsoft.Authorization/roleAssignments/roleDefinitionId'
            in: '9980e02c-c2be-4d73-94e8-173b1dc7cf3c'

          }
        ]
      }
      then: {
        effect: [ parameters('effect') ]
      } }
    policyType: 'custom'
  }
}
