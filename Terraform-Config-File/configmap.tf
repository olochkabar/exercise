resource "kubernetes_config_map" "turoapp-config" {
  metadata {
    name = "turoapp-config"
    namespace = var.namespace
  }

  data = {
   "NUMBER" = var.NUMBER
  }
}