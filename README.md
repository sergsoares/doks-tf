# Doks with Terraform

Codebase to create a simple DOKS cluster with terraform and Nginx Ingress Controller:

## Requirements:

- [Generate your Access Token to Digital Ocean](https://docs.digitalocean.com/reference/api/create-personal-access-token/)
- [Terraform](https://www.terraform.io/downloads.html)
- (Optional)[Digital Ocean CLI - doctl](https://github.com/digitalocean/doctl/releases)
- (Optional)[Kubectl](https://kubernetes.io/docs/tasks/tools/)

## Create Digital Ocean Cluster

This process initialize Digital Ocean kubernetes cluster with node pools and deploy Nginx Ingress controller.

```bash

# Generate your access token here: https://cloud.digitalocean.com/account/api/tokens
# Edit do_token inside terraform.tfvars

(~) $ terraform init
(~) $ cp terraform.tfvars.example terraform.tfvars

(~) $ terraform apply
```

#### Get IP from load balancer created by Nginx Ingress

Waiting terraform finish and open [Load Balance Console](https://cloud.digitalocean.com/networking/load_balancers?i=37a503&preserveScrollPosition=true) to get LB IP.

#### Download your kubeconfig file to deploy apps

After completion, add the k8s settings made in DO to your .kube/config.
We use the [**doctl**](https://docs.digitalocean.com/reference/doctl/how-to/install/)
doctl is the official DigitalOcean command line interface (CLI).

```bash

(~) $ doctl kubernetes cluster registry add <your-cluster-name>

```

Follow Digital ocean instructions to get your [kubeconfig](https://docs.digitalocean.com/products/kubernetes/how-to/connect-to-cluster/#doctl) an interact with cluster, recommended [Lens - K8S IDE](https://k8slens.dev/).

## TODO

- Create specific firewall inside process.
- An apps folder to maintain all manifests inside same repo.

## Knowledge issues

- Terraform Destroy stuck in a invalid state because delete cluster before Nginx ingress not destroying Loadbalancer created, need enter in [Load Balance Console](https://cloud.digitalocean.com/networking/load_balancers?i=37a503&preserveScrollPosition=true) and finish.

## References:

- https://www.padok.fr/en/blog/digitalocean-kubernetes
- https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs#example-usage
- https://github.com/sergsoares/lab-tf-k8s
- https://www.udemy.com/course/terraform-na-pratica/
- https://registry.terraform.io/providers/hashicorp/helm/latest/docs
- https://docs.nginx.com/nginx-ingress-controller/installation/installation-with-helm/
