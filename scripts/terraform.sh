#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

echo "You will work with: ";
echo ${gke_location};

export TF_VAR_cluster_name=${cluster_name};
export TF_VAR_gke_location=${gke_location};
export TF_VAR_inital_nodes=${inital_nodes};
export TF_VAR_node_pool_name=${node_pool_name};
export TF_VAR_node_pool_count=${node_pool_count};
export TF_VAR_is_preemptible=${is_preemptible};
export TF_VAR_vm_type=${vm_type};
export TF_VAR_helm_nginx_name=${helm_nginx_name};
export TF_VAR_chart_nginx_name=${chart_nginx_name};
export TF_VAR_registry_name=${registry_name};

echo "Variables configured"

function terraform_output {
    echo "Hi, I am gonna work with the configured variables"
    terraform output
}


function terraform_destroy {
    echo "Hi, I am gonna work with the configured variables"
    terraform plan -destroy -out "planfile"
    terraform apply "planfile"
}

function terraform_apply {
    echo "Hi, I am gonna work with the configured variables"
    terraform apply -input=false "planfile"
}

function terraform_plan {
    echo "Hi, I am gonna work with the configured variables"
    terraform plan --out "planfile"
}

function terraform_validate {
    terraform validate
}

function terraform_init () {
    terraform init
}

$1