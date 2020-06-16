output "container_registry_id" {
    value = google_container_registry.gcr_app_python.id
}
output "container_registry_bucket" {
    value = google_container_registry.gcr_app_python.bucket_self_link 
}