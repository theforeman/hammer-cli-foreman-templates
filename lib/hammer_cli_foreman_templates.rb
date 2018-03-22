require 'hammer_cli_foreman'
require 'hammer_cli_foreman/template'

module HammerCLIForemanTemplates
  require 'hammer_cli_foreman_templates/version'
  require 'hammer_cli_foreman_templates/import'
  require 'hammer_cli_foreman_templates/export'

  HammerCLI::MainCommand.lazy_subcommand(
    ImportCommand.command_name,
    ImportCommand.desc,
    'HammerCLIForemanTemplates::ImportCommand',
    'hammer_cli_foreman_templates/import'
  )
  HammerCLI::MainCommand.lazy_subcommand(
    ExportCommand.command_name,
    ExportCommand.desc,
    'HammerCLIForemanTemplates::ExportCommand',
    'hammer_cli_foreman_templates/export'
  )
end
