module "k8s_do" {
  source = "./modules/k8s_do"

  do_token    = var.do_token
  k8s_name    = var.k8s_name
  k8s_region  = var.k8s_region
  k8s_version = var.k8s_version
  k8s_tags    = var.k8s_tags

  default_node_pool_name       = var.default_node_pool_name
  default_node_pool_size       = var.default_node_pool_size
  default_node_pool_auto_scale = var.default_node_pool_auto_scale
  default_node_pool_count      = var.default_node_pool_count
  default_node_pool_tags       = var.default_node_pool_tags
  default_node_pool_labels     = var.default_node_pool_labels
}

data "digitalocean_kubernetes_cluster" "kubernetes_cluster" {
  name       = var.k8s_name
  depends_on = [module.k8s_do]
}

provider "kubectl" {
  host                   = data.digitalocean_kubernetes_cluster.kubernetes_cluster.endpoint
  cluster_ca_certificate = base64decode(data.digitalocean_kubernetes_cluster.kubernetes_cluster.kube_config[0].cluster_ca_certificate)
  token                  = data.digitalocean_kubernetes_cluster.kubernetes_cluster.kube_config[0].token

  load_config_file = false
}

provider "kubernetes" {
  host                   = data.digitalocean_kubernetes_cluster.kubernetes_cluster.endpoint
  cluster_ca_certificate = base64decode(data.digitalocean_kubernetes_cluster.kubernetes_cluster.kube_config[0].cluster_ca_certificate)
  token                  = data.digitalocean_kubernetes_cluster.kubernetes_cluster.kube_config[0].token
}

module "ingress_nginx" {
  source = "./modules/ingress_nginx"
}