variable "project_id" {}
variable "credentials" {}
variable "region" {}
variable "instance_name" {}
variable "machine_type" {}
variable "zone" {}


provider "google" {
  credentials = "${file("${var.credentials}")}"
  project     = "${var.project_id}"
  region      = "${var.region}"
}

resource "google_compute_instance" "instance-1" {
  name         = "${var.instance_name}"
  machine_type = "${var.machine_type}"
  zone         = "${var.zone}"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }


}

