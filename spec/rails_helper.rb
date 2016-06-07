ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require "capybara/rails"
require 'vcr'
require 'webmock'

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.use_transactional_fixtures = true # change to false if using selenium

  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!
  Shoulda::Matchers.configure do |config|
    config.integrate do |with|
      with.test_framework :rspec
      with.library :rails
    end
  end

  VCR.configure do |c|
    c.cassette_library_dir = "spec/casettes"
    c.hook_into :webmock
  end

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction # rollleaner.clean_with :truncation  # clean DB of any leftover back transactions between each test
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
