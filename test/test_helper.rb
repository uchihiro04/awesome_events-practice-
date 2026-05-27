ENV["RAILS_ENV"] ||= "test"

require 'simplecov'
require 'simplecov-lcov'

SimpleCov::Formatter::LcovFormatter.config do |c|
  c.report_with_single_file = true
end

SimpleCov.start 'rails' do
  formatter SimpleCov::Formatter::LcovFormatter
  command_name 'Minitest'
end

require_relative "../config/environment"
require "rails/test_help"
require 'minitest/mock'
require_relative 'sign_in_helper'

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    # parallelize(workers: :number_of_processors)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.

    # Add more helper methods to be used by all tests here...
  end
end
