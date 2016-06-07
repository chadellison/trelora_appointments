source 'https://rubygems.org'
ruby '2.3.0'
gem 'responders'
gem 'active_model_serializers', github: 'rails-api/active_model_serializers'
gem 'rails', '4.2.6'
gem 'pg'
gem 'sass-rails', '~> 5.0'
gem 'figaro'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'unicorn'
gem 'bcrypt', '~> 3.1.7'
gem 'faraday'

group :development, :test do
  gem 'selenium-webdriver'
  gem 'pry-rails'
end

group :production do
  gem 'rails_12factor'
end

group :test do
  gem 'capybara'
  gem 'launchy'
  gem 'vcr'
  gem 'webmock'
  gem 'shoulda-matchers', github: 'thoughtbot/shoulda-matchers'
  gem "database_cleaner"
  gem 'mocha'
  gem 'simplecov', :require => false
  gem 'rspec-rails', '~> 3.0'
end

group :development do
  gem 'web-console', '~> 2.0'
end
