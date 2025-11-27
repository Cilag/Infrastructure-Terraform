# Ressource de stockage d'artefacts (bucket GCS)
resource "google_storage_bucket" "app_artifacts" {
  name          = "${local.name_prefix}-artifacts"
  location      = var.gcp_region
  force_destroy = var.environment != "prod" ? true : false

  uniform_bucket_level_access = true

  versioning {
    enabled = true
  }

  labels = local.required_labels

  lifecycle_rule {
    condition {
      age = var.environment == "prod" ? 90 : 30
    }
    action {
      type = "Delete"
    }
  }
}