terraform {
  required_providers {
    okta = {
      source = "okta/okta"
      version = "~> 5.0.0"
    }
  }
}

provider "okta" {
  org_name = "your_okta_org_name" # Replace with your Okta organization name
  base_url = "okta.com"
  api_token = "your_okta_api_token" # Replace with your Okta API token
}


module "okta_groups" {
  source = "./modules/okta_groups"
  groups = var.groups
}

output "okta_emails_to_id" {
  description = "List of emails being fetched from Okta for ID mapping"
  value = module.okta_groups.okta_emails_to_id
}