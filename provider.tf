provider "google" {
  credentials = "${file("/l/disk0/proencio/terraform/sensedia/challenge-web-sensedia-427f679924f5.json")}"
  region      = "${var.region}"
  zone        = "${var.zone}"
}
