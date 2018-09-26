# Hammer CLI Foreman Templates

This Hammer CLI plugin contains set of commands for [foreman_templates](
  https://github.com/theforeman/foreman_templates
), a plugin to Foreman for syncing the contents of the Foreman Community
Templates [repository](
  https://github.com/theforeman/community-templates/
) (or a git repo of your choice).

## Versions

This is the list of which version of Foreman Templates is needed to which version of this plugin.

| Hammer Templates  | 0.1.0+ |
|-------------------|--------|
| Foreman Templates | 5.0.2+ |

## Installation

    $ gem install hammer_cli_foreman_templates

    $ mkdir -p ~/.hammer/cli.modules.d/

    $ cat <<EOQ > ~/.hammer/cli.modules.d/foreman_templates.yml
    :foreman_templates:
      :enable_module: true
    EOQ

    # to confirm things work, this should return useful output
    hammer import-templates --help
    hammer export-templates --help

## More info

See our [Hammer CLI installation and configuration instuctions](
https://github.com/theforeman/hammer-cli/blob/master/doc/installation.md#installation).

## Development setup
With this guide, you'll be able to set up hammer_cli_foreman_templates with hammer-cli-foreman for development.

### Requirements for this setup

These are the requirements for this setup. Note that some may not be needed at
all depending on your setup.

* git
* ruby
* rvm
* foreman

### Steps

First, cd into the directory where your projects will live. Then clone everything.

```bash
git clone https://github.com/theforeman/hammer-cli-foreman.git
git clone https://github.com/theforeman/hammer-cli-foreman-templates.git
```

Before we bundle, we need to setup our local Gemfile. Edit `Gemfile.local.rb` in your hammer_cli_foreman_templates directory to point to the local projects instead of using the gems. Enter the following:

```ruby
gem 'hammer_cli_foreman', :path => '../hammer-cli-foreman'
```

Now, let's create the directories we need for configuration.

```bash
mkdir -p ~/.hammer/cli.modules.d
```

Edit `~/.hammer/cli_config.yml` and [enter any hammer-cli config values you
want](https://github.com/theforeman/hammer-cli/blob/master/doc/installation.md#options).

Next edit `~/.hammer/cli.modules.d/foreman.yml` and enter the following:

```yaml
:foreman:
  :enable_module: true
  :host: 'http://foreman.example.com/'
  :username: 'admin'
  :password: 'changeme'
```

Edit `~/.hammer/cli.modules.d/foreman_templates.yml` and enter in the following:

```yaml
:foreman_templates:
  :enable_module: true
```

And then finally test out your installation:

```
bundle exec hammer -vh
```

You should see in the output:
```
Extension module hammer_cli_foreman_templates (version) loaded
```
If you see no errors, you should be good to go.
