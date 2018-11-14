require 'carrierwave'
require_relative 'boot'
require 'rails'

%w[
  action_controller/railtie
  action_view/railtie
  action_mailer/railtie
  active_job/railtie
  action_cable/engine
  rails/test_unit/railtie
  sprockets/railtie
].each do |railtie|
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
    config.time_zone = 'Kolkata'
    # config.mongoid.observers = :show_observer, :theatre_observer, :movie_observer
    config.generators do |g|
      g.orm             :mongoid
      g.template_engine :haml
    end
  end
end
