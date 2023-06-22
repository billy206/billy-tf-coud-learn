data "terraform_remote_state" "workspace" {
  backend = "remote"

  config = {
    organization = "billy-test-tf"
    workspaces = {
      name = "gke-billy-tf-coud-learn"
    }
  }
}