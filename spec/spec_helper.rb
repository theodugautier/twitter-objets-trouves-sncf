# frozen_string_literal: true

require 'rspec'

require_relative '../lib/api/base'
require_relative '../lib/api/object'
require_relative '../lib/api/station'
require_relative '../lib/sncf/station'
require_relative '../lib/sncf/object'

require 'simplecov'
SimpleCov.start

require 'webmock/rspec'
WebMock.disable_net_connect!(allow_localhost: true)

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
