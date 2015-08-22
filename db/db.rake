require 'yaml'
require 'pg'
require 'active_record'

module Migrations
  extend self

  attr_accessor :env, :config

  @env = ENV['DATABASE_ENV'] || 'development'
  @config = YAML.load_file('db/config.yml')

  def current_config
    config[env]
  end
end

ActiveRecord::Base.configurations = ::Migrations.config
ActiveRecord::Base.establish_connection(::Migrations.current_config)
ActiveRecord::Base.schema_format = :sql
ActiveRecord::Base.pluralize_table_names = false
ActiveRecord::Base.maintain_test_schema = false
ActiveRecord::Base.raise_in_transactional_callbacks = true

module ActiveRecord
  module Tasks
    DatabaseTasks.env = Migrations.env
    DatabaseTasks.db_dir = 'db'
    DatabaseTasks.migrations_paths = ['db/migrate']
    DatabaseTasks.database_configuration = Migrations.config
    DatabaseTasks.fixtures_path = nil
    DatabaseTasks.seed_loader = nil
  end
end

load 'active_record/railties/databases.rake'
