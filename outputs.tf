output "registry_modules_id" {
  description = "Map of id values across all registry_modules, keyed the same as var.registry_modules except keys with no id are omitted"
  value       = { for k, v in tfe_registry_module.registry_modules : k => v.id if v.id != null && length(v.id) > 0 }
}
output "registry_modules_initial_version" {
  description = "Map of initial_version values across all registry_modules, keyed the same as var.registry_modules except keys with no initial_version are omitted"
  value       = { for k, v in tfe_registry_module.registry_modules : k => v.initial_version if v.initial_version != null && length(v.initial_version) > 0 }
}
output "registry_modules_module_provider" {
  description = "Map of module_provider values across all registry_modules, keyed the same as var.registry_modules except keys with no module_provider are omitted"
  value       = { for k, v in tfe_registry_module.registry_modules : k => v.module_provider if v.module_provider != null && length(v.module_provider) > 0 }
}
output "registry_modules_name" {
  description = "Map of name values across all registry_modules, keyed the same as var.registry_modules except keys with no name are omitted"
  value       = { for k, v in tfe_registry_module.registry_modules : k => v.name if v.name != null && length(v.name) > 0 }
}
output "registry_modules_namespace" {
  description = "Map of namespace values across all registry_modules, keyed the same as var.registry_modules except keys with no namespace are omitted"
  value       = { for k, v in tfe_registry_module.registry_modules : k => v.namespace if v.namespace != null && length(v.namespace) > 0 }
}
output "registry_modules_no_code" {
  description = "Map of no_code values across all registry_modules, keyed the same as var.registry_modules except keys with no no_code are omitted"
  value       = { for k, v in tfe_registry_module.registry_modules : k => v.no_code if v.no_code != null }
}
output "registry_modules_organization" {
  description = "Map of organization values across all registry_modules, keyed the same as var.registry_modules except keys with no organization are omitted"
  value       = { for k, v in tfe_registry_module.registry_modules : k => v.organization if v.organization != null && length(v.organization) > 0 }
}
output "registry_modules_publishing_mechanism" {
  description = "Map of publishing_mechanism values across all registry_modules, keyed the same as var.registry_modules except keys with no publishing_mechanism are omitted"
  value       = { for k, v in tfe_registry_module.registry_modules : k => v.publishing_mechanism if v.publishing_mechanism != null && length(v.publishing_mechanism) > 0 }
}
output "registry_modules_registry_name" {
  description = "Map of registry_name values across all registry_modules, keyed the same as var.registry_modules except keys with no registry_name are omitted"
  value       = { for k, v in tfe_registry_module.registry_modules : k => v.registry_name if v.registry_name != null && length(v.registry_name) > 0 }
}
output "registry_modules_test_config" {
  description = "Map of test_config values across all registry_modules, keyed the same as var.registry_modules except keys with no test_config are omitted"
  value       = { for k, v in tfe_registry_module.registry_modules : k => v.test_config if v.test_config != null && length(v.test_config) > 0 }
}
output "registry_modules_vcs_repo" {
  description = "Map of vcs_repo values across all registry_modules, keyed the same as var.registry_modules except keys with no vcs_repo are omitted"
  value       = { for k, v in tfe_registry_module.registry_modules : k => one(v.vcs_repo) if v.vcs_repo != null && length(v.vcs_repo) > 0 }
}

