resource "digitalocean_droplet" "web" {
  name     = each.value
  image    = var.droplet_image
  region   = var.region
  size     = var.droplet_size
  ipv6     = var.droplet_ipv6
  tags     = var.droplet_tags
  for_each = toset(var.droplet_names)
}

resource "digitalocean_loadbalancer" "public" {
  name   = var.loadbalancer_name
  region = var.region

  forwarding_rule {
    entry_port     = 80
    entry_protocol = "http"

    target_port     = 80
    target_protocol = "http"
  }

  healthcheck {
    port     = 22
    protocol = "tcp"
  }

  droplet_ids = [for droplet in digitalocean_droplet.web : droplet.id]
}
