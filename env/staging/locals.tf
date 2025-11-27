locals {
  # Préfixe de nommage standard
  name_prefix = "${var.app_name}-${var.environment}"

  # Labels obligatoires fusionnés avec les labels personnalisés
  required_labels = merge(
    var.common_labels,
    {
      app         = var.app_name
      environment = var.environment
      owner       = var.owner
      cost_center = var.cost_center
      managed_by  = "terraform"
    }
  )
}