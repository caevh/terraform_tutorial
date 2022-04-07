variable "do_token" {
}

variable "droplet_names" {
  type    = list(string)
}


variable "droplet_image" {
  type    = string
}


variable "region" {
  type    = string
}


variable "droplet_size" {
  type    = string
}


variable "droplet_ipv6" {
  type    = bool
}


variable "droplet_tags" {
  type    = list(string)

}


variable "loadbalancer_name" {
  type    = string
}
