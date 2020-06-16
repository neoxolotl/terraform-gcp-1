resource "helm_release" "helm-nginx" {
  name       = var.helm_nginx_name
  chart      = var.chart_nginx_name

  timeout = 600
}