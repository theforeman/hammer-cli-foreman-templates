$:.unshift File.expand_path("../lib", __FILE__)
require "hammer_cli_foreman_templates/version"

Gem::Specification.new do |s|

  s.name = "hammer_cli_foreman_templates"
  s.version = HammerCLIForemanTemplates.version.dup
  s.platform = Gem::Platform::RUBY

  s.authors = ["Oleh Fedorenko"]
  s.email = "ofedoren@redhat.com"
  s.homepage = "http://github.com/ofedoren/hammer-cli-foreman-templates"
  s.license = "GPL-3.0"

  s.summary = %q{CLI plugin with import and export commands}
  s.description = <<EOF
CLI plugin with import and export commands for HammerCLI-Foreman
EOF

  s.files = Dir['{lib,config}/**/*', 'LICENSE', 'README.md']
  s.extra_rdoc_files = ['LICENSE', 'README.md']
  s.require_paths = ["lib"]

  s.add_dependency 'hammer_cli_foreman', '>= 0.11.0'
  # s.add_dependency 'foreman_templates', '>= 5.0.1'
end
