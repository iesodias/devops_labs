@minLength(1)
param location string = resourceGroup().location

param containerImage string = 'iesodias/java-api:latest'

resource containerAppEnv 'Microsoft.App/managedEnvironments@2023-05-01' = {
  name: 'dev-env'
  location: location
  properties: {}
}

resource javaApi 'Microsoft.App/containerApps@2023-05-01' = {
  name: 'java-api'
  location: location
  properties: {
    managedEnvironmentId: containerAppEnv.id
    configuration: {
      ingress: {
        external: true
        targetPort: 8081
        transport: 'auto'
      }
    }
    template: {
      containers: [
        {
          name: 'app'
          image: containerImage
          resources: {
            cpu: '0.5'
            memory: '1.0Gi'
          }
        }
      ]
    }
  }
}

output javaAppUrl string = javaApi.properties.configuration.ingress.fqdn
