require 'pry'
require 'byebug'
require 'pry-byebug'
require 'mifiel'
require 'webmock/rspec'

Dir['./spec/support/**/*.rb'].each { |f| require f }

RSpec.configure do |config|

  config.before(:suite) do
    Mifiel.config do |config|
      config.app_id = 'APP_ID'
      config.app_secret = 'APP_SECRET'
    end
  end

  config.before(:each) do
    stub_request(:any, /mifiel.com/).to_rack(FakeMifiel)
  end
end
