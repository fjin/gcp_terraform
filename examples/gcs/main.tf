module "bucket" {
  source = "../../modules/gcs"

  name       = var.name
  project_id = var.project_id
  location   = var.region

//  log_bucket        = "fan_log_bucket_2"
  log_object_prefix = "logs_"
  versioning        = "false"
  bucket_policy_only = "true"


  lifecycle_rules = [{
    action = {
      type = "Delete"
    }
    condition = {
      age        = 365
      with_state = "ANY"
    }
  }]

  iam_members = [{
    role   = "roles/storage.admin"
    member = "user:fjingcp@gmail.com"
  }]

  force_destroy = "true"
}


module "log_bucket" {
  source = "../../modules/gcs"

  name       = var.log_bucket_name
  project_id = var.project_id
  location   = var.region
  versioning = "false"
  bucket_policy_only = "true"

  lifecycle_rules = [{
    action = {
      type = "Delete"
    }
    condition = {
      age        = 365
      with_state = "ANY"
    }
  }]

  iam_members = [{
    role   = "roles/storage.legacyBucketWriter"
    member = "group:cloud-storage-analytics@google.com"
  }]

  force_destroy = "true"
}

module "log_bucket2" {
  source = "../../modules/gcs"

  name       = "fan_log_bucket_2"
  project_id = "marine-equinox-325705"
  location   = "australia-southeast1"
  versioning = "false"

  lifecycle_rules = [{
    action = {
      type = "Delete"
    }
    condition = {
      age        = 365
      with_state = "ANY"
    }
  }]

  iam_members = [{
    role   = "roles/storage.legacyBucketWriter"
    member = "group:cloud-storage-analytics@google.com"
  }]
}

resource "google_logging_project_sink" "bucket_sink" {
  name = "fan-bucket-sink"
  project = var.project_id
  # Can export to pubsub, cloud storage, or bigquery
  destination = "storage.googleapis.com/fan_log_bucket_2"

  # Log all WARN or higher severity messages relating to instances
  filter = "resource.type = gcs_bucket"

  # Use a unique writer (creates a unique service account used for writing)
  unique_writer_identity = true
}