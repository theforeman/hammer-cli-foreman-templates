module HammerCLIForemanTemplates
  class ExportCommand < HammerCLIForeman::Command
    command_name 'export-templates'
    desc _('Export templates to a git repo or a directory on the server')

    resource :template, :export

    success_message _('Export finished')
    failure_message _('Could not export')

    build_options without: [:verbose]
  end
end
