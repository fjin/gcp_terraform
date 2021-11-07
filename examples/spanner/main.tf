resource "google_spanner_instance" "spanner" {
  project = var.project_id
  config       = "regional-australia-southeast1"
  display_name = "FanTestSpannerInstance"
  num_nodes    = 2
  labels = {
    "name" = "fan-spanner"
  }
  force_destroy = true
}

resource "google_spanner_database" "database" {
  project = var.project_id
  instance = google_spanner_instance.spanner.name
  name     = "fan-database"
  ddl = [
    "CREATE TABLE t1 (t1 INT64 NOT NULL,) PRIMARY KEY(t1)",
    "CREATE TABLE t2 (t2 INT64 NOT NULL,) PRIMARY KEY(t2)",
  ]
  deletion_protection = false
}