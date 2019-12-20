source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.5'
# ruby version
ruby '2.5.0'
# Use Puma as the app server
gem 'puma', '~> 3.12'
# Http request
gem 'httparty', '~> 0.16.0'
# Ruby gem to load environment variables
gem 'dotenv-rails', :require => 'dotenv/rails-now'

# documentation
gem 'swagger-docs'

group :development, :test do
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  #tests
  gem 'rspec-rails', '~> 3.7'

  gem 'database_cleaner'

  gem 'vcr', '~> 3.0.3'

  gem 'webmock'

  gem 'factory_bot_rails'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :production do
  gem 'pg', '~> 0.21'
  gem 'rails_12factor'
end
