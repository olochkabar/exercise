resource "kubernetes_config_map" "page-config" {
  metadata {
    name = "page-config"
    namespace = var.namespace
  }

  data = {
    # using a file function to avoid errors and keep code clean
    "config.html" = "${file("${path.module}/config.html")}"
  }
}
