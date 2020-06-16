resource "google_container_cluster" "gke_primary" {
  name     = var.cluster_name
  location = var.gke_location

  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       = var.inital_nodes

  master_auth {
    username = ""
    password = ""

    client_certificate_config {
      issue_client_certificate = false
    }
  }
}

resource "google_container_node_pool" "gke_primary_node_pool" {
  name       = var.node_pool_name
  location   = var.gke_location
  cluster    = google_container_cluster.gke_primary.name
  node_count = var.node_pool_count

  node_config {
    preemptible  = var.is_preemptible
    machine_type = var.vm_type

    metadata = {
      disable-legacy-endpoints = "true"
    }

    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }

  timeouts {
    create = "30m"
    update = "20m"
  }
}