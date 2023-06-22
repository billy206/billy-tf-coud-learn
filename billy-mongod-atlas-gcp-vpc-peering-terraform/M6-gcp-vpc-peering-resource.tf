resource "google_compute_network_peering" "vpc-peering" {
  name = "ldpro-dev-route-to-mongo-atlas"
  # TODO
  network = data.terraform_remote_state.workspace.outputs.network_id
  # The URI of the Atlas VPC
  peer_network = "https://www.googleapis.com/compute/v1/projects/${mongodbatlas_network_peering.mongodb-atlas-peering.atlas_gcp_project_id}/global/networks/${mongodbatlas_network_peering.mongodb-atlas-peering.atlas_vpc_name}"
}
