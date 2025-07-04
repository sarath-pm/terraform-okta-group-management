variable "groups" {
  description = "List of groups with user memberships"
  type = list(object({
    name        = string
    description = string
    users       = list(string)
  }))
}