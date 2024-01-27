
 resource "kubernetes_ingress_v1" "turoapp-ingress" {
  metadata {
    name = "turoapp-ingress"
    namespace = "candidate-d"
    annotations = {
      "nginx.ingress.kubernetes.io/ssl-redirect" = "true"
      "nginx.ingress.kubernetes.io/rewrite-target" = "/"
      "alb.ingress.kubernetes.io/target-type" = "instance"
      # Ingress Core Settings
      "alb.ingress.kubernetes.io/scheme" = "internet-facing"
      # External DNS - For creating a Record Set in Route53
      "external-dns.alpha.kubernetes.io/hostname" = "oluwa.test-subaccount-1-v02.test-subaccount-1.rr.mu"
      # SSL Settings
      "alb.ingress.kubernetes.io/ssl-redirect" = 443
      "alb.ingress.kubernetes.io/certificate-arn" = "arn:aws:acm:us-east-1:663118211814:certificate/b7966c21-51ec-430e-b6fb-a0410e0af514"
      "alb.ingress.kubernetes.io/listen-ports" = jsonencode([{"HTTPS" = 443}, {"HTTP" = 80}])
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


