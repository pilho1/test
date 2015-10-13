require 'selenium/webdriver'
require 'capybara/rspec'


Capybara.default_driver = :selenium
Capybara.run_server = false
Capybara.app_host = "https://www.dollarshaveclub.com/our-products"
Capybara.default_wait_time = 40



RSpec.configure do |config|

end
