data "google_compute_image" "my_image" {
  family  = "ubuntu-1804-lts"
  project = "ubuntu-os-cloud"
}

resource "google_compute_instance" "challenge-web-sensedia" {
  name         = "challenge-web-sensedia"
  machine_type = "n1-standard-1"
  zone         = "${var.zone}"
  project      = "${var.project}"

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }

  metadata_startup_script = <<EOF
    #!/bin/bash

    apt update
    apt install docker docker.io wget unzip -y
    wget https://depositfiles.s3.amazonaws.com/candidato/app-candidato.zip
    unzip app-candidato.zip
    cd app-candidato
    docker build -t sensedia .
    docker run -d -e CODIGO_CANDIDATO=mty3ytrkzjri -p 5000:5000 sensedia
  EOF

  tags = ["fw-rule-challenge-web-sensedia"]

  boot_disk {
    initialize_params {
      image = "${data.google_compute_image.my_image.self_link}"
    }
  }
}

resource "google_compute_firewall" "firewall-challenge-web-sensedia" {
  name    = "firewall-allow-challenge-web-sensedia"
  project = "${var.project}"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["5000"]
  }

  target_tags = ["fw-rule-challenge-web-sensedia"]
}
