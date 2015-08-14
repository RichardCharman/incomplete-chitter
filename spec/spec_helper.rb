ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', 'app/tricher.rb')

require 'coveralls'
require 'simplecov'
require 'capybara/rspec'
require 'database_cleaner'
require 'byebug'
require 'factory_girl'

Capybara.app = Tricher

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!

RSpec.configure do |config|
    config.include FactoryGirl::Syntax::Methods
    
  config.before(:all) do
    FactoryGirl.reload
  end
end
  RSpec.configure do |config|

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

end