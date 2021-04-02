provider "helm" {
  kubernetes {
    config_path = var.kubeconfig 
  }
}

resource "helm_release" "nginx_ingress" {
  name       = "nginx-ingress-controller"

  repository = "https://helm.nginx.com/stable"
  chart      = "nginx-ingress"

  set {
    name  = "service.type"
    value = "ClusterIP"
  }

  set {
    name  = "controller.kind"
    value = "daemonset"
  }
}
