resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = true
}

resource "docker_container" "nginx" {
  name  = var.container_name
  image = docker_image.nginx.name

  ports {
    internal = 80
    external = var.host_port
  }

  mounts {
    target = "/usr/share/nginx/html"
    type   = "bind"
    source = "${path.module}/html"
  }
}