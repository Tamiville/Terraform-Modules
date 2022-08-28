locals {
  # Common tags to be assigned to all resources
  database_tags = {
    Service     = "devOps"
    company     = "elitesolutionsit"
    Owner       = "tamiville"
    environment = "Development"
    ManagedWith = "terraform"
  }
  server      = var.server
  buildregion = var.buildregion
}