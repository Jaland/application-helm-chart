## Prerequisites

* Openshift 4.4+
* Opensshift Piplelines(tekton)
* Update Base Domain in the `values.yaml`
  * I.E. if your console url is `https://console-openshift-console.apps.cluster-d709.d709.sandbox810.opentlc.com` than your global.cluster.basedomain should be `apps.cluster-d709.d709.sandbox810.opentlc.com`


## Example Frontend/Backend deployment

Creates a DeploymentConfig, Service, and ImageStream for a frontend and backend application. Sets up a PostgresDB. And Puts the services behind an OAuth proxy using Keycloak as a security realm.

Also sets up a Tekton pipeline

#### Update Helm Dependencies

```
helm dependency update
```

#### Install Helm Chart

```
helm install postgres/postgres-chart --name-template <TEMPLATE_NAME>
```

### Update Helm Chart to newer version

Update `appVersion` in the `Chart.yaml` file

```
helm upgrade <TEMPLATE_NAME> .
```

### 

Start Pipeline 