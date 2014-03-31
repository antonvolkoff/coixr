source 'https://rubygems.org'

gem 'rails', '4.0.3'

gem 'mongoid', github: 'mongoid/mongoid'
gem 'bson_ext'
gem 'puma'

# Assets stuff...
gem 'sass-rails',   '~> 4.0.0'
gem 'uglifier',     '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'

# Core
gem 'interactor-rails', '~> 1.0'
gem 'parslet'
gem 'anemone'
gem 'nokogiri'
gem 'draper'
gem 'kaminari'

group :development, :test do
  gem 'rspec-rails', '~> 3.0.0.beta'
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'timecop'
  gem 'pry'
  gem 'database_cleaner'
  gem 'fabrication'
end

group :production do
  gem 'rails_12factor'
end

group :development do
  gem 'capistrano', '~> 3.1'
  gem 'capistrano-rails', '~> 1.0.0'
  gem 'capistrano3-puma'
  gem 'capistrano-bundler', '~> 1.1.2'
  gem 'capistrano-rbenv', '~> 2.0'
end