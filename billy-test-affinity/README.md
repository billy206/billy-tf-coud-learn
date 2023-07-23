## Branch: Prod - GKE

| Subent Name        | Subent CIDR    |
| ------------------ | -------------- |
| Primary Subnet     | 172.8.32.0/19  |
| Secondary services | 172.8.64.0/20  |
| Secondary pods     | 172.8.128.0/18 |
| Database Subnet    | 172.8.210.0/24 |

## Create a New GKE need modity files, remember create a workspace on terraform cloud

- L1-version.tf
  - cloud
    - organization
    - workspaces.name
- terraform.tfvars
  - environment
  - product_name (options)
- vpt.auto.tfvars
  - network_subnet_ip
  - network_subnet_secondary_range_pod_ip
  - network_subnet_secondary_range_service_ip
- ip-resources.auto.tfvars
  - psc_database_subnet_cidr
- gke.auto.tfvars
  - cluster_master_ipv4_cidr_block

## :warning: 以下是新專案時執行

- Enable Kubernetes Engine API

```bash
  gcloud services enable container.googleapis.com --project [PROJECT_ID]
```

- Enable Cloud Resource Manager API

```bash
  gcloud services enable cloudresourcemanager.googleapis.com --project [PROJECT_ID]
```

- Enable Cloud SQL Admin API

```bash
gcloud services enable sqladmin.googleapis.com --project [PROJECT_ID]
```

## GCP IAM Permission List

```t
  Kubernetes Engine 管理員 (roles/container.admin)
  Kubernetes Engine 叢集管理員 (roles/container.clusterAdmin)
  Kubernetes Engine 檢視者 (roles/container.viewer)
  Cloud SQL 管理員 (roles/cloudsql.admin)
  Cloud SQL 編輯者 (roles/cloudsql.editor)
  Cloud SQL 檢視者 (roles/cloudsql.viewer)
  Compute 網路管理員 (roles/compute.networkAdmin)
  Compute 安全管理員 (roles/compute.securityAdmin)
  Compute 檢視者 (roles/compute.viewer)
  服務網路管理員 (roles/servicenetworking.networksAdmin)
  服務帳戶使用者 (roles/iam.serviceAccountUser)
```

## Create GCP IAM Service Account

```bash
  gcloud iam service-accounts create [IAM_NAME] --project=[PROJECT_ID]
```

## IAM Policy Binding Authorization for Terraform GCP IAM Account

- Cloud SQL

```bash
  gcloud projects add-iam-policy-binding [PROJECT_ID] --member=serviceAccount:[SERVICE_ACCOUNT_EMAIL] --role=roles/cloudsql.admin
  gcloud projects add-iam-policy-binding [PROJECT_ID] --member=serviceAccount:[SERVICE_ACCOUNT_EMAIL] --role=roles/cloudsql.editor
  gcloud projects add-iam-policy-binding [PROJECT_ID] --member=serviceAccount:[SERVICE_ACCOUNT_EMAIL] --role=roles/cloudsql.viewer
```

- Kubernetes Engine

```bash
  gcloud projects add-iam-policy-binding [PROJECT_ID] --member=serviceAccount:[SERVICE_ACCOUNT_EMAIL] --role=roles/container.admin
  gcloud projects add-iam-policy-binding [PROJECT_ID] --member=serviceAccount:[SERVICE_ACCOUNT_EMAIL] --role=roles/container.clusterAdmin
  gcloud projects add-iam-policy-binding [PROJECT_ID] --member=serviceAccount:[SERVICE_ACCOUNT_EMAIL] --role=roles/container.viewer
```

- Compute Engine

```bash
  gcloud projects add-iam-policy-binding [PROJECT_ID] --member=serviceAccount:[SERVICE_ACCOUNT_EMAIL] --role=roles/compute.networkAdmin
  gcloud projects add-iam-policy-binding [PROJECT_ID] --member=serviceAccount:[SERVICE_ACCOUNT_EMAIL] --role=roles/compute.securityAdmin
  gcloud projects add-iam-policy-binding [PROJECT_ID] --member=serviceAccount:[SERVICE_ACCOUNT_EMAIL] --role=roles/compute.viewer
```

- Service Network（Prviate Service Connection）

```bash
  gcloud projects add-iam-policy-binding [PROJECT_ID] --member=serviceAccount:[SERVICE_ACCOUNT_EMAIL] --role=roles/servicenetworking.networksAdmin
```

- Service Account User

```bash
  gcloud projects add-iam-policy-binding [PROJECT_ID] --member=serviceAccount:[SERVICE_ACCOUNT_EMAIL] --role=roles/iam.serviceAccountUser
```
