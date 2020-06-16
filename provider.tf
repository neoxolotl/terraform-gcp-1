provider "google" {
    version = "~> 3.26"
    credentials = file("account.json")
    project     = var.project_id
    region      = var.gcp_region
}