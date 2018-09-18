$:.unshift File.expand_path("../lib", __FILE__)
require "hammer_cli_foreman_templates/version"

Gem::Specification.new do |s|

  s.name = "hammer_cli_foreman_templates"
  s.version = HammerCLIForemanTemplates.version.dup
  s.platform = Gem::Platform::RUBY

  s.authors = ["The Foreman team"]
  s.homepage = "https://github.com/theforeman/hammer-cli-foreman-templates"
  s.license = "GPL-3.0"

  s.summary = %q{Foreman Hammer commands for exporting and importing templates}
  s.description = <<EOF
CLI plugin with import and export commands for Hammer_CLI_Foreman
EOF

  s.files = Dir['{lib,config}/**/*', 'LICENSE', 'README.md']
  s.extra_rdoc_files = ['LICENSE', 'README.md']
  s.require_paths = ["lib"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency 'hammer_cli_foreman', '>= 0.11.0'
end
