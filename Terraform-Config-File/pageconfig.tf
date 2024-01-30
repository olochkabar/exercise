resource "kubernetes_config_map" "page-config" {
  metadata {
    name = "page-config"
    namespace = var.namespace
  }

  data = {
    "config.html" = "${file("${path.module}/config.html")}"
  }
}
