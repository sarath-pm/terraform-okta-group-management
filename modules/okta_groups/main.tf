terraform {
  required_providers {
    okta = {
      source  = "okta/okta"
      version = "~> 5.0.0"
    }
  }
}
resource "okta_group" "group" {
  for_each    = { for group in var.groups : group.name => group }
  name        = each.value.name
  description = each.value.description
}

data "okta_user" "user_emails" {
    for_each = toset(flatten([for group in var.groups : group.users]))
    search {
        name  = "profile.email"
        value = each.key
    }
}

resource "okta_group_memberships" "people" {
  for_each = { for group in var.groups : group.name => group }

  group_id = okta_group.group[each.key].id
  users    = [for user_email in each.value.users : data.okta_user.user_emails[user_email].id]
}