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
This project is licensed under the MIT License - see the LICENSE file for details.

## Contributing
If you'd like to contribute to this project, feel free to open issues or submit pull requests. Contributions are always welcome!
Feel free to tweak the content to better fit your script’s specific functionalities or any other details you want to highlight. Let me know if you'd like further edits!

## Connect with Me
<em><b>I love connecting with different people,</b> so if you want to say <b>hi, I'd be delighted to meet you!</b>😃</em>
<p align="center">
<a href="https://www.linkedin.com/in/sarath-p-m/" target="blank"><img align="center" src="https://i.pinimg.com/originals/de/b4/6f/deb46f02a59e3b3a2aa58fac16290d63.gif" alt="sarath-p-m" height="40" width="45" /></a>
&nbsp;<a href="https://dev.to/sarath-pm" target="blank"><img align="center" src="https://res.cloudinary.com/practicaldev/image/fetch/s--0UiMFgbU--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_66%2Cw_880/https://thepracticaldev.s3.amazonaws.com/i/0vbfzhjcsjs0u716x88o.gif" alt="sarath_pm" height="40" width="47" /></a>
&nbsp;<a href="https://sarath-pm.medium.com/" target="blank"><img align="center" src="https://github.com/sarath-pm/sarath-pm/assets/86669668/09a4f7ca-c73f-481c-ac8f-d751a91fa062" alt="sarath_pm" height="40" width="47" /></a>  
&nbsp;<a href="mailto:sarath.pm@outlook.com" target="blank"><img align="center" src="https://user-images.githubusercontent.com/86669668/171339003-ef5b5c96-eac8-478c-a9cc-318ca9477fce.gif" alt="sarath.pm@outlook.com" width="40" /></a>      
&nbsp;<a href="https://www.hackerrank.com/sarath_pm" target="blank"><img align="center" src="https://user-images.githubusercontent.com/86669668/171338019-50f8c8de-e1ac-4651-b2cf-1901eceb2e51.gif" alt="sarath_pm" height="40" width="45"></a>
</p>