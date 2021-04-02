# Doks with Terraform

Codebase to create a simple DOKS cluster with terraform:

## Requirements:

- [Generate your Access Token to Digital Ocean](https://docs.digitalocean.com/reference/api/create-personal-access-token/)
- [Terraform](https://www.terraform.io/downloads.html)
- [Kubectl](https://kubernetes.io/docs/tasks/tools/)
- (Optional) [Digital Ocean CLI - doctl](https://github.com/digitalocean/doctl/releases)

## Create Digital Ocean Cluster

This process initialize Digital Ocean kubernetes cluster with node pools.

```bash
(~) $ cd 01-cluster

(~/01-cluster)$ terraform init
(~/01-cluster)$ cp terraform.tfvars.example terraform.tfvars

# Edit do_token inside terraform.tfvars

(~/01-cluster)$ terraform apply

```

### Download your kubeconfig file

https://docs.digitalocean.com/products/kubernetes/how-to/connect-to-cluster/#doctl

## Create System configurations

This process initialize infrastructure apps (Ingress Controller).

```bash
(~) $ cd 02-system

(~/02-system)$ terraform init
(~/02-system)$ cp terraform.tfvars.example terraform.tfvars
(~/02-system)$ terraform apply

```

## Create System configurations

This process initialize infrastructure apps (Ingress Controller).

```bash
(~) $ cd 03-apps

(~/03-apps)$ kubectl apply -f example-app.yml
```


## Probably TODO

- Create firewall inside process.

## References:

- https://www.padok.fr/en/blog/digitalocean-kubernetes
- https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs#example-usage
- https://github.com/sergsoares/lab-tf-k8s
- https://www.udemy.com/course/terraform-na-pratica/
- https://registry.terraform.io/providers/hashicorp/helm/latest/docs
- https://docs.nginx.com/nginx-ingress-controller/installation/installation-with-helm/
