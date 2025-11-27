output "artifacts_bucket_name" {
  description = "Nom du bucket d'artefacts"
  value       = google_storage_bucket.app_artifacts.name
}

output "artifacts_bucket_id" {
  description = "ID unique du bucket d'artefacts"
  value       = google_storage_bucket.app_artifacts.id
}

output "artifacts_bucket_url" {
  description = "URL du bucket d'artefacts"
  value       = google_storage_bucket.app_artifacts.url
}

output "environment" {
  description = "Environnement déployé"
  value       = var.environment
}
