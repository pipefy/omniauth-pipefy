require 'bundler/setup'
require 'omniauth/pipefy'
require 'simplecov'

SimpleCov.start do
  minimum_coverage(95.0)
end

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
