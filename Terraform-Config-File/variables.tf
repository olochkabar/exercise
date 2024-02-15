#general variables

variable "namespace" {
    type = string
    default = "candidate-d"
}

variable "app" {
    type = string
    default = "olu-app"
}

variable "config_path" {
    type = string

}

variable "config_context" {
    type = string
}


#deployment variables
variable "replicas" {
    type = number
    default = 1
}

variable "image" {
    type = string
    default = "olochkabar/oluapp:v1.0.0"
}

#service variables

variable "port" {
    type = number
    default = 80
}

variable "target_port" {
    type = number
    default = 80
}

variable "service_type" {
    type = string
    default = "ClusterIP"
}


#configmap variables

variable "NUMBER" {
    type = string
    default = "1.5 billion"
}

#ingress variables

variable "host" {
    type = string
    default = "olu.test-subaccount-1-v02.test-subaccount-1.rr.mu"
}

variable "acm" {
    type = string
}

variable "ssl" {
    type = bool
    default = "true"
}    