require_relative "boot"

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_mailbox/engine"
require "action_text/engine"
require "action_view/railtie"
require "action_cable/engine"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

# require_relative '../mingines/core/lib/core/engine.rb'
# require_relative '../mingines/landing/lib/landing/engine.rb'
# require_relative '../mingines/blogs/lib/blogs/engine.rb'
# we need to tell rails where to find and load our engines
Dir.chdir('mingines') do
  Dir.glob('*').select { |f| File.directory? f }.each do |name|
    require_relative "../mingines/#{name}/lib/#{name}/engine.rb"
  end
end

module ClassMingines
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.1

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # we need to tell rails wher to find the engine migrations
    config.paths['db/migrate'] << 'mingines/*/db/migrate'

    # Don't generate system test files.
    config.generators.system_tests = nil
  end
end
