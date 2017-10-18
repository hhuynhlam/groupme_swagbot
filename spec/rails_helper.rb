# frozen_string_literal: true
require 'simplecov'
SimpleCov.start 'rails'

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)

if ENV['CODECOV_TOKEN']
  require 'codecov'
  SimpleCov.formatter = SimpleCov::Formatter::Codecov
end

abort('The Rails environment is running in production mode!') if Rails.env.production?

require 'spec_helper'
require 'rspec/rails'
require 'active_model'
require 'shoulda/matchers'
require 'sidekiq/testing'
require 'aasm/rspec'

RSpec.configure do |config|
  config.include Devise::Test::ControllerHelpers, type: :controller

  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!

  require 'mongoid-rspec'
  config.include(Mongoid::Matchers, type: :model)

  config.include(ActiveJob::TestHelper, type: :controller)

  config.before(:each) do
    Timecop.freeze(Time.new(2016, 1, 1, 0, 0, 0, '+00:00'))
  end

  config.after(:each) do
    Timecop.return
  end

  config.before(type: :controller) do
    request.accept = 'application/vnd.api+json'

    allow(controller).to receive(:method_missing)
      .with(:current_user)
  end

  # clean out the queue after each spec
  config.after(:each, type: :controller) do
    ActiveJob::Base.queue_adapter.enqueued_jobs = []
    ActiveJob::Base.queue_adapter.performed_jobs = []
  end
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :active_model
  end
end
