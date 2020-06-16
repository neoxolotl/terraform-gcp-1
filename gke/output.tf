output "gke_endpoint" {
    value = google_container_cluster.gke_primary.endpoint
}
output "gke_id" {
    value = google_container_cluster.gke_primary.id
}
output "gke_ca_certificate" {
    value = google_container_cluster.gke_primary.master_auth.0.cluster_ca_certificate
}