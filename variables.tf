variable "registry_modules" {
  description = <<EOT
Map of registry_modules, attributes below
Optional:
    - initial_version
    - module_provider
    - name
    - namespace
    - no_code
    - organization
    - registry_name
    - test_config (block):
        - agent_execution_mode (optional)
        - agent_pool_id (optional)
        - tests_enabled (optional)
    - vcs_repo (block):
        - branch (optional)
        - display_identifier (optional)
        - github_app_installation_id (optional)
        - identifier (required)
        - oauth_token_id (optional)
        - source_directory (optional)
        - tag_prefix (optional)
        - tags (optional)
EOT

  type = map(object({
    initial_version = optional(string)
    module_provider = optional(string)
    name            = optional(string)
    namespace       = optional(string)
    no_code         = optional(bool)
    organization    = optional(string)
    registry_name   = optional(string)
    test_config = optional(list(object({
      agent_execution_mode = optional(string)
      agent_pool_id        = optional(string)
      tests_enabled        = optional(bool)
    })))
    vcs_repo = optional(object({
      branch                     = optional(string)
      display_identifier         = optional(string)
      github_app_installation_id = optional(string)
      identifier                 = string
      oauth_token_id             = optional(string)
      source_directory           = optional(string)
      tag_prefix                 = optional(string)
      tags                       = optional(bool)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.registry_modules : (
        v.registry_name == null || (contains([for v in ["private", "public"] : lower(v)], lower(v.registry_name)))
      )
    ])
    error_message = "must be one of: \"private\", \"public\""
  }
  validation {
    condition = alltrue([
      for k, v in var.registry_modules : (
        v.test_config == null || alltrue([for item in v.test_config : (item.agent_execution_mode == null || (contains(["agent", "remote"], item.agent_execution_mode)))])
      )
    ])
    error_message = "must be one of: \"agent\", \"remote\""
  }
}

