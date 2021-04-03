resource "kubernetes_namespace" "nginx-namespace" {
  metadata {
    name = "ingress-nginx"
    labels = {
      "app.kubernetes.io/name" = "ingress-nginx"
      "app.kubernetes.io/instance" = "ingress-nginx"
    }
  }
}

data "kubectl_file_documents" "nginx_manifests" {
  content = file("${path.module}/nginx-deployment.yml")
}

resource "kubectl_manifest" "nginx_apply" {
    count     = length(data.kubectl_file_documents.nginx_manifests.documents)
    yaml_body = element(data.kubectl_file_documents.nginx_manifests.documents, count.index)
    depends_on = [
      kubernetes_namespace.nginx-namespace
    ]
}