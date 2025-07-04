output "okta_emails_to_id" {
  value = keys(data.okta_user.user_emails)
}