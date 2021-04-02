# Doks with Terraform

Application to be user to create a DOKS cluster with terraform:

- Generate your Access Token
  - https://docs.digitalocean.com/reference/api/create-personal-access-token/


- Create DO Cluster
  - terraform init
  - cd cluster
  - terraform apply -auto-approve

- Create Infra Apps
  - terraform init 
  - cd cluster
  - terraform apply -auto-approve

- Create Apps
  - kubectl apply -f


## References:

- https://www.padok.fr/en/blog/digitalocean-kubernetes
- https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs#example-usage
- https://github.com/sergsoares/lab-tf-k8s
- https://www.udemy.com/course/terraform-na-pratica/
- https://registry.terraform.io/providers/hashicorp/helm/latest/docs
- https://docs.nginx.com/nginx-ingress-controller/installation/installation-with-helm/
