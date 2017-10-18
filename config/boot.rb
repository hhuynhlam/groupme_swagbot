# frozen_string_literal: true
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)

require 'bundler/setup' # Set up gems listed in the Gemfile.
require 'csv'
require 'mixlib/config'

if (ENV['RUBY_ENV'] || ENV['RACK_ENV']) == 'development'
	require 'dotenv'
	Dotenv.load
end

require File.expand_path('../settings', __FILE__)
