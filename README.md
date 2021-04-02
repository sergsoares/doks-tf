# Doks with Terraform

Codebase to create a DOKS cluster with terraform:

- Generate your Access Token
  - https://docs.digitalocean.com/reference/api/create-personal-access-token/

## Create Digital Ocean Cluster

This process initialize Digital Ocean kubernetes cluster with node pools.

```bash
(~) $ cd cluster

(~/cluster)$ terraform init
(~/cluster)$ cp terraform.tfvars.example terraform.tfvars

# Edit do_token inside terraform.tfvars

(~/cluster)$ terraform apply

```

### Download your kubeconfig file

https://docs.digitalocean.com/products/kubernetes/how-to/connect-to-cluster/#doctl

## Create Infra Apps

This process initialize infrastructure apps (Ingress Controller).

```bash
(~) $ cd infra-apps

(~/infra-apps)$ terraform init
(~/infra-apps)$ cp terraform.tfvars.example terraform.tfvars
(~/infra-apps)$ terraform apply

```

## References:

- https://www.padok.fr/en/blog/digitalocean-kubernetes
- https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs#example-usage
- https://github.com/sergsoares/lab-tf-k8s
- https://www.udemy.com/course/terraform-na-pratica/
- https://registry.terraform.io/providers/hashicorp/helm/latest/docs
- https://docs.nginx.com/nginx-ingress-controller/installation/installation-with-helm/
