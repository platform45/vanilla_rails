require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module VanillaRails
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    # i18n
    config.i18n.default_locale  = :en
    config.i18n.load_path      += Dir["#{Rails.root}/config/locales/**/*.{rb,yml}"]

    # TimeZone
    config.time_zone = 'Pretoria'

    # ActiveRecord
    config.active_record.default_timezone = :utc
    # config.active_record.schema_format    = :sql

    # Sidekiq
    # config.active_job.queue_adapter = :sidekiq

    # Error pages
    config.exceptions_app = self.routes

    # ActionMailer
    if Rails.application.secrets.postmark_api_key.present?
      config.action_mailer.delivery_method = :postmark
      config.action_mailer.postmark_settings = {
        api_key: Rails.application.secrets.postmark_api_key
      }
    else
      config.action_mailer.delivery_method = :sendmail
    end

    # Generators
    # config.generators do |g|
    #   g.orm                 :active_record,
    #                         primary_key_type: :uuid
    #   g.test_framework      :rspec,
    #                         fixtures: true,
    #                         view_specs: false
    #   g.fixture_replacement :factory_girl,
    #                         dir: 'spec/factories'
    # end
  end
end
