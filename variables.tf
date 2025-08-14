variable "container_name" {
  description = "Name of the NGINX container"
  type        = string
  default     = "tf-nginx"
}

variable "host_port" {
  description = "Port on host to map to NGINX"
  type        = number
  default     = 8080
}