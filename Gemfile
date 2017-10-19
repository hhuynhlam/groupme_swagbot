# frozen_string_literal: true
source 'https://rubygems.org'

ruby '2.3.1'

gem 'rails', '~> 5.0.0'

gem 'active_model_serializers'
gem 'faraday'
gem 'jazz_fingers'
gem 'mixlib-config'
gem 'mongoid'
gem 'pry-rails'
gem 'rack-cors', require: 'rack/cors'
gem 'redis-namespace'
gem 'sidekiq'
gem "simple_scheduler"
gem 'sinatra', github: 'sinatra'
gem 'virtus'
gem 'zapier_ruby'

group :development, :test do
  gem 'dotenv-rails'
  gem 'rspec-rails'
  gem 'rubocop', require: false
  gem 'timecop'
end

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'spring-commands-rspec'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'spring'
end

group :test do
  gem 'codecov', require: false
  gem 'mongoid-rspec'
  gem 'rails-controller-testing'
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
end

group :production, :test do
  gem 'puma'
  gem 'rails_12factor'
end
