terraform {
  required_version = ">= 0.14"

  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = ">= 2.7.0"
    }
  }
}

provider "digitalocean" {
  token = var.do_token
}