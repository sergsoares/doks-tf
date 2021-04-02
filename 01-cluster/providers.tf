
terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
    }
  }
}

# Configure the DigitalOcean Provider
provider "digitalocean" {
  token = var.do_token
}