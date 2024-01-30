resource "kubernetes_service_v1" "olu-app-svc" {
  metadata {
    name = "olu-app-svc"
    namespace = var.namespace
  }

  spec {
    selector = {
     app = kubernetes_deployment_v1.olu-app.metadata.0.labels.app
    }

    port {
      port        = var.port
      target_port = var.target_port
    }

    type = var.service_type
  }
}