resource "kubernetes_config_map" "turoapp-config" {
  metadata {
    name = "turoapp-config"
    namespace = var.namespace
  }

  data = {
    #"NUMBER" = "1.6 billion"
   "NUMBER" = var.NUMBER
  }
}