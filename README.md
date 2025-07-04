# Okta Group and User Management with Terraform

This project demonstrates how to manage Okta groups and assign users to those groups using Terraform. It provides a reusable module for creating groups, looking up users by email, and managing group memberships—all in a declarative, version-controlled way.

## Features

- **Create Okta Groups:** Define groups with names and descriptions.
- **Assign Users to Groups:** Assign users to groups by specifying their email addresses.
- **User Lookup:** Automatically look up Okta user IDs by email.
- **Outputs:** View mappings of group names to user emails and user emails to Okta user IDs.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) v1.0 or later
- An [Okta](https://developer.okta.com/) account with API token
- Okta users already created (by email)

## Usage

### 1. Clone the Repository

```bash
git clone <your-repo-url>
cd Okta
```

### 2. Configure Variables

Edit `terraform.tfvars` to define your groups and users:

```hcl
groups = [
    {
    name        = "infra-group"
    description = "Group for Infrastructure"
    users       = ["oktatest@sarathpm.xyz",
    "testokta@sarathpm.xyz"]
    },
    {
    name        = "developer-group"
    description = "Group for developers"
    users       = ["sarath2375@gmail.com"]
    }
]
```

### 3. Set Up Provider

Edit `main.tf` with your Okta organization and API token:

```hcl
provider "okta" {
  org_name  = "<your-okta-org-name>"
  base_url  = "okta.com"
  api_token = "<your-okta-api-token>"
}
```

### 4. Initialize and Apply

```bash
terraform init
terraform plan
terraform apply
```

### 5. View Outputs

After `terraform apply`, you’ll see outputs such as:

- **Group to User Emails:** Which users are assigned to which groups
- **User Email to Okta ID:** Mapping of user emails to Okta user IDs

You can also run:

```bash
terraform output
```

## Module Structure

- `modules/okta_groups/main.tf`: Logic for group creation, user lookup, and membership assignment
- `modules/okta_groups/outputs.tf`: Outputs for group-to-email and email-to-ID mappings
- `terraform.tfvars`: Your group and user assignments

## Notes

- Users must already exist in Okta before you assign them to groups.
- Outputs are for visibility and do not affect your Okta resources.
- API tokens should be kept secure and not committed to version control.

## License

MIT

---

*Happy automating Okta with Terraform!*