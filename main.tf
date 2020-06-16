data "google_client_config" "client" {}

module "gke" {
    source = "./gke"
    cluster_name = var.cluster_name
    gke_location = var.gke_location
    inital_nodes = var.inital_nodes
    node_pool_name = var.node_pool_name
    node_pool_count = var.node_pool_count
    is_preemptible = var.is_preemptible
    vm_type = var.vm_type
}

module "gcr" {
    source = "./gcr"
}

module "nginx-ingress" {
    source = "./nginx-ingress"
    helm_nginx_name = var.helm_nginx_name
    chart_nginx_name = var.chart_nginx_name
    providers = {
      helm = helm.gke-cluster
  }
}

provider "helm" {
    alias = "gke-cluster"
    kubernetes {
        host = module.gke.gke_endpoint
        cluster_ca_certificate = base64decode(module.gke.gke_ca_certificate)
        token = data.google_client_config.client.access_token
    }
}