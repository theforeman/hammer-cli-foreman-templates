module HammerCLIForemanTemplates
  class ImportCommand < HammerCLIForeman::Command
    command_name 'import-templates'
    desc _('Import templates from a git repo or a directory on the server')

    resource :template, :import

    success_message _('Import finished.')
    failure_message _('Could not import')

    output do
      field :id, _('Id'), Fields::Id
      field :name, _('Name')
      field :type, _('Type')
      field :imported, _('Imported')
      field :changed, _('Changed')
      field nil, _('Changes'), Fields::Label, hide_blank: true do
        field :diff, nil, Fields::LongText, hide_blank: true
      end
      field nil, _('Errors'), Fields::Label, hide_blank: true do
        field :validation_errors, _('Validation'), Fields::Collection, hide_blank: true do
          field nil, nil
        end
        field :additional_errors, _('Additional'), Fields::LongText, hide_blank: true
        field :exception, _('Exception'), Fields::LongText, hide_blank: true
      end
    end

    def execute
      templates = send_request['templates']
      if option_verbose
        templates.each do |template|
          if template['validation_errors'].empty?
            template['validation_errors'] = nil
          else
            validation_errors = []
            template['validation_errors'].each do |key, value|
              validation_errors << "#{key.capitalize}: #{value}"
            end
            template['validation_errors'] = validation_errors
          end
        end
      else
        templates = []
      end
      print_data(templates)
      HammerCLI::EX_OK
    end

    build_options
  end
end
