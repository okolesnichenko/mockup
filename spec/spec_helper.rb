require "rspec"
require "rack/test"
require_relative '../app/endpoints'


ENV['RACK_ENV'] = 'test'
RSpec.configure do |config|
  config.include Rack::Test::Methods
  def app
    Endpoints.new # this defines the active application for this test
  end
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  config.shared_context_metadata_behavior = :apply_to_host_groups
end
