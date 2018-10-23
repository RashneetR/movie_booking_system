require 'carrierwave'
#require 'carrierwave/orm/activerecord'

require_relative 'boot'

#require "rails"
#require "active_storage/engine"
#require "action_controller/railtie"
#require "action_mailer/railtie"
#require "sprockets/railtie"
#require "rails/test_unit/railtie"

require "rails"

%w(
  action_controller/railtie
  action_view/railtie
  action_mailer/railtie
  active_job/railtie
  action_cable/engine
  rails/test_unit/railtie
  sprockets/railtie
).each do |railtie|
  begin
    require railtie
  rescue LoadError
  end
end



# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MovieBookingSystem
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.active_job.queue_adapter = :sidekiq
    # config.mongoid.observers = :show_observer, :theatre_observer, :movie_observer
    config.generators do |g|
      g.orm             :mongoid
      g.template_engine :haml
    end

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
