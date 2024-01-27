terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.25.2"
    }
  }
}

#Terraform Kubernetes Provider
provider "kubernetes" {
  config_path = var.config_path
  config_context = var.config_context
} 
