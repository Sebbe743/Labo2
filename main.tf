terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = ">= 2.13.0"
    }
  }
}

provider "docker" {
  host    = "npipe:////.//pipe//docker_engine"
}

resource "docker_image" "packet" {
  name         = "nginx:latest"
  keep_locally = true
}

resource "docker_container" "packet" {
  image = docker_image.packet.latest
  name  = "tutorial"
  ports {
    internal = 80
    external = 8000
  }
}
