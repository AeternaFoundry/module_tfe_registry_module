resource "tfe_registry_module" "registry_modules" {
  for_each = var.registry_modules

  initial_version = each.value.initial_version
  module_provider = each.value.module_provider
  name            = each.value.name
  namespace       = each.value.namespace
  no_code         = each.value.no_code
  organization    = each.value.organization
  registry_name   = each.value.registry_name

  dynamic "test_config" {
    for_each = each.value.test_config != null ? each.value.test_config : []
    content {
      agent_execution_mode = test_config.value.agent_execution_mode
      agent_pool_id        = test_config.value.agent_pool_id
      tests_enabled        = test_config.value.tests_enabled
    }
  }

  dynamic "vcs_repo" {
    for_each = each.value.vcs_repo != null ? [each.value.vcs_repo] : []
    content {
      branch                     = vcs_repo.value.branch
      display_identifier         = vcs_repo.value.display_identifier
      github_app_installation_id = vcs_repo.value.github_app_installation_id
      identifier                 = vcs_repo.value.identifier
      oauth_token_id             = vcs_repo.value.oauth_token_id
      source_directory           = vcs_repo.value.source_directory
      tag_prefix                 = vcs_repo.value.tag_prefix
      tags                       = vcs_repo.value.tags
    }
  }
}

