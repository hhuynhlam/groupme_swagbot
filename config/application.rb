# frozen_string_literal: true
require_relative 'boot'

# require 'rails'
# Pick the frameworks you want:
require 'active_model/railtie'
require 'active_job/railtie'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_cable/engine'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module PartnerApi
  class Application < Rails::Application
    # Use the responders controller from the responders gem
    config.app_generators.scaffold_controller :responders_controller

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true

    config.time_zone = 'Pacific Time (US & Canada)'
    config.use_standard_json_time_format = true

    config.active_job.queue_adapter = :sidekiq

    config.generators do |g|
      g.orm :mongoid
      g.helper false
      g.assets false
      g.stylesheets false
      g.javascripts false
      g.view_specs false
      g.model_specs false
    end
  end
end
