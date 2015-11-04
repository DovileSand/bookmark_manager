ENV['RACK_ENV'] = 'test'

require 'capybara/rspec'
# require 'dm-postgres-adapter'
require './app/data_mapper_setup'
require './app/models/link'
require './app/models/tag'
require './app/app'
require 'database_cleaner'

Capybara.app = BookmarkManager

RSpec.configure do |config|

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  # config.before(:each) do
  #   DatabaseCleaner.start
  # end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end

  # config.after(:each) do
  #   DatabaseCleaner.clean
  # end


end
