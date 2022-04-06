resource "digitalocean_droplet" "web" {
  name     = each.value
  image    = "ubuntu-18-04-x64"
  region   = "lon1"
  size     = "s-1vcpu-1gb"
  for_each = toset(var.droplet_names)
}

resource "digitalocean_loadbalancer" "public" {
  name   = "loadbalancer-1"
  region = "lon1"

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
