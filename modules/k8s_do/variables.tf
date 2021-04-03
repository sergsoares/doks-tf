variable "do_token" {
	type = string
	description = "Digital Ocean token"
}

variable "k8s_name" {
  type = string
  description = "Kubernetes Cluster name"
}

variable "k8s_region" {
  type = string
  description = "Kubernetes Cluster Region"
}

variable "k8s_tags"{
  type = list(string)
  description = "Kubernetes Cluster Tags to resource" 
}

variable "k8s_version" {
  type = string
  description = "Kubernetes Cluster version"
}

variable "default_node_pool_name" {
  type = string
  description = "Default Node Pool name"
}

variable "default_node_pool_size" {
  type = string
  description = "Default Node Pool droplet size"
}

variable "default_node_pool_auto_scale" {
  type = bool
  description = "Default Node Pool AutoScale true/false"
}

variable "default_node_pool_count" {
  type = number
  description = "Default Node Pool count"
}

variable "default_node_pool_tags" {
  type = list(string)
  description = "Default Node Pool tags"
}

variable "default_node_pool_labels" {
  type = map(string)
  description = "Default Node Pool labels"
}