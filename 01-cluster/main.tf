
resource "digitalocean_kubernetes_cluster" "kubernetes_cluster" {
  name    = var.k8s_name
  region  = var.k8s_region
  version = var.k8s_version
  tags    = var.k8s_tags

  # This default node pool is mandatory
  node_pool {
    name       = var.default_node_pool_name
    size       = var.default_node_pool_size
    auto_scale = var.default_node_pool_auto_scale
    node_count = var.default_node_pool_count
    tags       = var.default_node_pool_tags
    labels     = var.default_node_pool_labels
  }
}
