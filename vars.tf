variable "do_token" {
  type        = string
  description = "Digital Access API token"
}

variable "droplet_names" {
  type    = list(string)
  default = ["web1", "web2"]

}
