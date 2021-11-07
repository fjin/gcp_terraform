resource "google_compute_instance" "default" {
  project      = var.project_id
  name         = var.compute_engine_name
  machine_type = var.instance_type
  zone         = var.zone

  tags = ["name", "test"]

  boot_disk {
    initialize_params {
      image = var.image
    }
  }


  network_interface {
    network = "terraform-vpc"
    subnetwork = "terraform-subnetwork-public"
    access_config {
      // Ephemeral public IP
    }
  }

  metadata = {
    foo = "bar"
  }

  metadata_startup_script = "echo hi > /test.txt"

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = var.service_account_email
    scopes = ["cloud-platform"]
  }
}