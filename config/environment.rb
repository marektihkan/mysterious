require File.expand_path('../boot', __FILE__)

environment = ENV['RACK_ENV'] || 'development'

Bundler.require(:default, environment)
require File.expand_path('../../lib/mysterious/application', __FILE__)

Mysterious::Application.configure do |config|
  config.environment = environment
  config.root = File.expand_path('../..', __FILE__)

  config.load_paths! %w(
    lib/mysterious/users/password_authenticable.rb
    lib/mysterious/api/v1/serializers
    lib/mysterious/**/*.rb
  )

  # Middlewares
  config.middleware.use Rack::Lock
  config.middleware.use Rack::Runtime
  config.middleware.use Rack::MethodOverride
  config.middleware.use Rack::CommonLogger, config.logger

  config.middleware.use ActiveRecord::ConnectionAdapters::ConnectionManagement

  config.middleware.use Rack::Head
  config.middleware.use Rack::ConditionalGet
  config.middleware.use Rack::ETag
  config.middleware.use Rack::Cors

  # ActiveRecord
  config.active_record.logger = config.logger
  config.active_record.maintain_test_schema = false
  config.active_record.raise_in_transactional_callbacks = true
end

Mysterious::Application.initialize!
