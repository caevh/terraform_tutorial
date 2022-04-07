module "wordpress_web_server" {
  source = "../../modules/wordpress"
  do_token      = var.do_token
  droplet_names = ["web1", "web2"]
  droplet_image = "ubuntu-18-04-x64"
  region        = "lon1"
  droplet_size  = "s-1vcpu-1gb"
  droplet_ipv6  = false
  droplet_tags  = ["webserver"]
  loadbalancer_name = "loadbalancer-1"
}
