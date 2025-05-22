resource "google_logging_project_sink" "audit_logins" {
  name        = "audit-logins"
  destination = "bigquery.googleapis.com/projects/${var.project_id}/datasets/audit_logs"
  filter      = "protoPayload.authenticationInfo.principalEmail:*"
  unique_writer_identity = true
}