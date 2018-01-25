require 'hammer_cli_foreman'
require 'hammer_cli_foreman/template'

module HammerCLIForemanTemplates

  class ImportCommand < HammerCLIForeman::Command

    command_name 'import'
    desc _("Imports templates")

    resource :template, :import

    success_message _("Import finished")
    failure_message _("Could not import")

    build_options
  end

  HammerCLIForeman::Template.subcommand(
    'import',
    _("Imports templates"),
    HammerCLIForemanTemplates::ImportCommand
  )

end