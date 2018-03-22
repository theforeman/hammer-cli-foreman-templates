module HammerCLIForemanTemplates
  class ImportCommand < HammerCLIForeman::Command
    command_name 'import-templates'
    desc _('Import templates from a git repo or a directory on the server')

    resource :template, :import

    success_message _('Import finished')
    failure_message _('Could not import')

    build_options without: [:verbose]
  end
end
