resource "digitalocean_droplet" "web" {
    name = each.value
    image  = "ubuntu-18-04-x64"
    region = "lon1"
    size   = "s-1vcpu-1gb"
    for_each = toset(var.droplet_names)
}
