require 'simplecov'
SimpleCov.start 'rails'

require 'database_cleaner'
require 'spec_helper'

ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../../config/environment', __FILE__)

abort("The Rails environment is running in production mode!") if Rails.env.production?

require 'rspec/rails'

# Shoulda Matchers Configs
Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

ActiveRecord::Migration.maintain_test_schema!

Dir[Rails.root.join('spec/helpers/**/*.rb')].each do |file|
  require file
end

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.include RequestSpecHelper, type: :request

  config.use_transactional_fixtures = true

  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!

  # FactoryBot Configs
  config.include FactoryBot::Syntax::Methods

  # DatabaseCleaner Configs
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
    DatabaseCleaner.strategy = :transaction
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end
