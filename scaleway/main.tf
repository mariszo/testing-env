variable "organization" {}
variable "token" {}
variable "region" {}
variable "instance_name" {}
variable "image" {}
variable "machine_type" {}

provider "scaleway" {
  organization = "${var.organization}"
  token        = "${var.token}"
  region       = "${var.region}"
}

resource "scaleway_server" "instance-1" {
  name  = "${var.instance_name}"
  dynamic_ip_required = true
  image = "${var.image}"
  type  = "${var.machine_type}"
}
