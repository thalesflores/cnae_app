# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
require 'spec_helper'
require 'rspec/rails'
require 'vcr'
require 'support/factory_bot'


ActiveRecord::Migration.maintain_test_schema!

DatabaseCleaner.strategy = :truncation

RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"


  config.use_transactional_fixtures = true

  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!

end

VCR.configure do |config|
  config.hook_into :webmock
  config.cassette_library_dir = 'spec/support/fixtures/vcr_cassettes'
  config.default_cassette_options[:match_requests_on] = [:method, :uri, :body]
  config.default_cassette_options[:record] = :new_episodes
  config.allow_http_connections_when_no_cassette = true
  config.ignore_hosts 'notify.bugsnag.com'
end
