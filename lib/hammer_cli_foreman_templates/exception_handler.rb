module HammerCLIForemanTemplates
  class ExceptionHandler < HammerCLIForeman::ExceptionHandler
    def mappings
      [
        [RestClient::InternalServerError, :handle_internal_error],
      ] + super
    end

    protected

    def handle_internal_error(e)
      handle_templates_error(e)
      HammerCLI::EX_SOFTWARE
    end

    def handle_templates_error(e)
      response = JSON.parse(e.response)
      response = HammerCLIForeman.record_to_common_format(response)
      print_error(response['error'] || response['warning'])
      log_full_error e
    end
  end
end
