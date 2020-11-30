## Example Frontend/Backend deployment

Creates a DeploymentConfig, Service, and ImageStream for a frontend and backend application. Sets up a PostgresDB. And Puts the services behind an OAuth proxy using Keycloak as a security realm.

Also sets up a Tekton pipeline

### Prerequisites:

* Local Installation of [Helm 3](https://helm.sh/docs/intro/install/)
* Openshift 4 cluster
* [Openshift Pipelines](https://docs.openshift.com/container-platform/4.4/pipelines/installing-pipelines.html)
 

Note: You will also need to update the `global.cluster.baseDomain` inside of our `values.yaml` file to be the domain name of your Kubernetes cluster.
<sub>This can be found using your openshift console url. I.E. if your console url is `https://console-openshift-console.apps.cluster-99df.99df.sandbox1911.opentlc.com/` than your domain name would be `apps.cluster-99df.99df.sandbox1911.opentlc.com</sub>
	

### Application Architecture

Today we will be deploying a basic “Todo List” application consisting of the following:
* React Frontend
* SpringBoot Backend
* Postgres Database
* oAuth 2 proxy
* Keycloak Security Realm

All of the Kubernetes resources will be created using Helm 3, and the application containers will be built and deployed with a basic Openshift Pipeline setup.


### Install the Helm Chart

#### Update Helm Dependencies

```
helm dependency update
```

#### Run Helm Install

First validate that the `global.cluster.basedomain` inside of the 

```
helm install <RELEASE_NAME> .
```

### Update Helm Chart to newer version

Update `appVersion` in the `Chart.yaml` file

```
helm upgrade <RELEASE_NAME> .
```