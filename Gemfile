source 'https://rubygems.org'

ruby '2.5.0'

gem 'rails', '~> 5.2.3'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.12'
gem 'bootsnap', '>= 1.1.0', require: false

# secure password store
gem 'bcrypt'

gem 'rack-cors', require: 'rack/cors'

group :development, :test do
  gem 'pry-byebug'
  gem 'rspec-rails', '~> 3.8'
  gem 'factory_bot_rails'
  gem 'guard'
  gem 'guard-rspec'
  gem 'faker'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'shoulda-matchers'
  gem 'database_cleaner'
  gem 'simplecov', :require => false
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
