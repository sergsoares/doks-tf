
terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0.0"
    }
  }
}

# Configure the DigitalOcean Provider
provider "digitalocean" {
  token = var.do_token
}


resource "digitalocean_kubernetes_cluster" "kubernetes_cluster" {
  name    = "terraform-do-cluster"
  region  = "ams3"
  version = "1.20.2-do.0"

  tags = ["my-tag"]

  # This default node pool is mandatory
  node_pool {
    name       = "default-pool"
    size       = "s-1vcpu-2gb" # minimum size, list available options with `doctl compute size list`
    auto_scale = false
    node_count = 2
    tags       = ["node-pool-tag"]
    labels = {}
  }

}

# Another node pool for applications
resource "digitalocean_kubernetes_node_pool" "app_node_pool" {
  cluster_id = digitalocean_kubernetes_cluster.kubernetes_cluster.id

  name = "app-pool"
  size = "s-2vcpu-4gb" # bigger instances
  tags = ["applications"]

  # you can setup autoscaling
  auto_scale = true
  min_nodes  = 2
  max_nodes  = 5
  labels = {
    service  = "apps"
    priority = "high"
  }
}