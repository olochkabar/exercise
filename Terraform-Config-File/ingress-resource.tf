
 resource "kubernetes_ingress_v1" "turoapp-ingress" {
  metadata {
    name = "turoapp-ingress"
    namespace = "candidate-d"
    annotations = {
      "nginx.ingress.kubernetes.io/ssl-redirect" = "true"
      "nginx.ingress.kubernetes.io/rewrite-target" = "/"
     
      # External DNS - For creating a Record Set in Route53
      "external-dns.alpha.kubernetes.io/hostname" = "oluwa.test-subaccount-1-v02.test-subaccount-1.rr.mu"
     
      # SSL Settings
      "alb.ingress.kubernetes.io/certificate-arn" = "arn:aws:acm:us-east-1:663118211814:certificate/b7966c21-51ec-430e-b6fb-a0410e0af514"
    }
  }

  spec {
    ingress_class_name = "nginx"
    rule {
      host = "oluwa.test-subaccount-1-v02.test-subaccount-1.rr.mu"
      http {
        path {
          backend {
            service {
              name = kubernetes_service_v1.olu-app-svc.metadata[0].name
              port {
                number = 80
              }
            }
          }
          path = "/"
        }
      }
    }
  }
}


