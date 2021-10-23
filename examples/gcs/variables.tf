variable "project_id" {
  description = "The ID of the project in which to provision resources."
  type        = string
  default     = "marine-equinox-325705"
}

variable "region" {
  description = "Name of the region"
  type        = string
  default     = "australia-southeast1"
}

variable "name" {
  description = "Name of the buckets to create."
  type        = string
  default     = "fan-test-bucket1"
}

variable "log_bucket_name" {
  description = "Name of the log buckets to create."
  type        = string
  default     = "fan-log-bucket1"
}
