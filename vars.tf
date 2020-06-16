/*
    GENERAL
*/
variable "project_id" {
    type    =   string
    description = "GCP Project ID"
}
variable "gcp_region" {
    type = string
    description = "GCP Region"
}

/*
    GKE
*/
variable "cluster_name" {
    type = string
    description = "GKE Cluster name"
}
variable "gke_location" {
    type = string
    description = "GKE Location"
}
variable "inital_nodes" {
    type = number
    description = "Number of initial nodes"
}
variable "node_pool_name" {
    type = string
    description = "GKE Node pool name"
}
variable "node_pool_count" {
    type = number
    description = "Number of nodes"
}
variable "is_preemptible" {
    type = bool
    description = "True of False if a it vm is preemptible"
}
variable "vm_type" {
    type = string
    description = "Type of VM"
}

/*
    HELM
*/
variable "helm_nginx_name" {
    type = string
    description = "Name for helm installation"
}
variable "chart_nginx_name" {
    type = string
    description = "Helm chart name"
}
