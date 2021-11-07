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

variable "service_account_email" {
  description = "service account email"
  type = string
  default = "terraform-serviceaccount@marine-equinox-325705.iam.gserviceaccount.com"
}

variable "compute_engine_name" {
  description = "Compute Engine name"
  type = string
  default = "test-engine"

}

variable "zone" {
  description = "Name of the zone"
  type        = string
  default     = "australia-southeast1-a"
}

variable "instance_type" {
  description = "instance type"
  type = string
  default = "e2-micro"
}

variable "image" {
  description = "image"
  type = string
  default = "rocky-linux-cloud/rocky-linux-8"
}