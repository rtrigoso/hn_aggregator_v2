variable "SUPABASE_ORG_SLUG" {
  description = "organization slug used to id supabase project org"
  type = string
}

variable "SUPABASE_DATABASE_PASSWORD" {
  description = "used to create db. please keep private"
  type = string
}

resource "supabase_project" "hn_aggregator_v2" {
  organization_id = var.SUPABASE_ORG_SLUG
  name = "hn_aggregator_v2"
  database_password = var.SUPABASE_DATABASE_PASSWORD
  region = "ap-southeast-1"

  lifecycle {
    ignore_changes = [ database_password ]
  }
}

resource "supabase_settings" "dev" {
  project_ref = supabase_project.hn_aggregator_v2.id
}

output "supabase_project_id" {
  value       = supabase_project.hn_aggregator_v2.id
  description = "supabase project id"
}
