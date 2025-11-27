variable "gcp_project_id" {
  description = "ID du projet GCP"
  type        = string
}

variable "gcp_region" {
  description = "Région GCP principale"
  type        = string
  default     = "europe-west1"
}

variable "environment" {
  description = "Environnement (dev, staging, prod)"
  type        = string
  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "L'environnement doit être dev, staging ou prod."
  }
}

variable "app_name" {
  description = "Nom logique de l'application"
  type        = string
}

variable "common_labels" {
  description = "Labels communs à appliquer sur toutes les ressources"
  type        = map(string)
  default     = {}
}

variable "owner" {
  description = "Propriétaire des ressources"
  type        = string
}

variable "cost_center" {
  description = "Centre de coût"
  type        = string
  default     = "IT"
}
