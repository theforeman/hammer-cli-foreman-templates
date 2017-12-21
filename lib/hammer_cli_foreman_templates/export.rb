require 'hammer_cli'
require 'hammer_cli_foreman'
require 'hammer_cli_foreman/template'

module HammerCLIForemanTemplates

  class ExportCommand < HammerCLIForeman::Command

    command_name 'export'
    desc _("Exports templates")

    resource :template, :export

    success_message _("Export finished")
    failure_message _("Could not export")

    build_options
  end

  HammerCLIForeman::Template.subcommand(
    'export',
    _("Exports templates"),
    HammerCLIForemanTemplates::ExportCommand
  )

end