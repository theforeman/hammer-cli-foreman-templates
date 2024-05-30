module HammerCLIForemanTemplates
  class ExportCommand < HammerCLIForeman::Command
    command_name 'export-templates'
    desc _('Export templates to a git repo or a directory on the server')

    resource :templates, :export

    success_message _('Export finished.')
    failure_message _('Could not export')

    option '--verbose', 'BE_VERBOSE', _('Be verbose'),
      format: HammerCLI::Options::Normalizers::Bool.new

    output do
      field :id, _('Id'), Fields::Id
      field :name, _('Name')
      field :type, _('Type')
      field :exported, _('Exported')
    end

    def execute
      templates = send_request['templates']
      templates = [] unless option_verbose
      print_data(templates)
      HammerCLI::EX_OK
    end

    build_options
  end
end
