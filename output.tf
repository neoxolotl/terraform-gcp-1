output "cluster_id" {
    value = module.gke.gke_id
}
output "cluster_endpoint" {
    value = module.gke.gke_endpoint
}
output "container_registry_id" {
    value = module.gcr.container_registry_id
}
output "container_registry_bucket" {
    value = module.gcr.container_registry_bucket
}