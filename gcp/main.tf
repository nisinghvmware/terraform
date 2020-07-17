provider "google" {
#  credentials = file("account.json")
  project     = "abx-service-for-tango"
  region      = "us-east1"
  zone        = "us-east1-b"
}

variable "prefix" {
  default = "vmware-gadagip-test"
}

resource "google_compute_instance" "vm_instance" {
  name         = "${var.prefix}-instance"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    # A default network is created for all GCP projects
    network       = "default"
    access_config {
    }
  }
}
