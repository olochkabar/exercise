resource "kubernetes_deployment_v1" "olu-app" {
  metadata {
    name = "olu-app"
    namespace = var.namespace
    labels = {
      app = var.app
    }
  }

  spec {
    replicas = var.replicas

    selector {
      match_labels = {
        app = var.app
      }
    }

    template {
      metadata {
        labels = {
          app = var.app
        }
      }

      spec {
        container {
          image = "olochkabar/turoapp:v2.0.0"
          name  = "oluapp"
          env {
            name = "NUMBER"
            value_from {
              config_map_key_ref {
                name = kubernetes_config_map.turoapp-config.metadata[0].name
                key  = "NUMBER"
              }
            }
          }
          volume_mount {
            name       = "config-volume"
            mount_path = "/usr/share/nginx/html/config.html"
            #use sub_path to prevent config.html from overiding other html files inside /usr/share/nginx/html and make them inaccessible
            sub_path = "config.html"
          }
        }
        volume {
          name = "config-volume"

          config_map {
            name = kubernetes_config_map.page-config.metadata[0].name
          }
        }
      }
    }
  }
}