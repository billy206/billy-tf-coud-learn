## MongoDB Atlas Region

| GCP Region      | Location         | Atlas Region              | Support  |
| --------------- | ---------------- | ------------------------- | -------- |
| asia-east1      | Taiwan           | EASTERN_ASIA_PACIFIC      | M0,M2,M5 |
| asia-east2      | Hong Kong, China | ASIA_EAST_2               | x        |
| asia-southeast1 | Singapore        | SOUTHEASTERN_ASIA_PACIFIC | M0       |

## Authenticate the Provider

```t
  MONGODB_ATLAS_PUBLIC_KEY=[PUBLIC KEY]
  MONGODB_ATLAS_PRIVATE_KEY=[PRIVATE KEY]
```

## MongoDB Atlas Create API Key for "Terraform" use in Project

- Choose Project
- The top title of the left sidebar is "PROJECT"
- Go to Access Manager -> Click on **Create API Key**
  - **Description**: Terraform API Key
  - **Project Permissions**: Project Cluster Manager
  - Click on **Add Access List Entry**
    - Input 0.0.0.0/1
- Refer Link for **Access List Entry** https://github.com/mongodb/terraform-provider-mongodbatlas/issues/1048#issuecomment-1428524993

## Billy Public & Private Key

```bash
  export MONGODB_ATLAS_PUBLIC_KEY=vmqikyff
  export MONGODB_ATLAS_PRIVATE_KEY=cbcf1ab0-efc1-4b3b-abfa-1dbb49f6c008
```
