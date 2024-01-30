
 resource "kubernetes_ingress_v1" "turoapp-ingress" {
  metadata {
    name = "turoapp-ingress"
    namespace = var.namespace
    annotations = {
      "nginx.ingress.kubernetes.io/ssl-redirect" = var.ssl
      "nginx.ingress.kubernetes.io/rewrite-target" = "/"
     
      # External DNS - For creating a Record Set in Route53
      "external-dns.alpha.kubernetes.io/hostname" = var.host
     
      # SSL Settings
      "alb.ingress.kubernetes.io/certificate-arn" = var.acm
    }
  }

  spec {
    ingress_class_name = "nginx"
    rule {
      host = var.host
      http {
        path {
          backend {
            service {
              name = kubernetes_service_v1.olu-app-svc.metadata[0].name
              port {
                number = var.port
              }
            }
          }
          path = "/"
        }
      }
    }
  }
}


