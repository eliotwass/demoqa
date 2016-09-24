require 'capybara/cucumber'
require 'capybara-screenshot/cucumber'
require 'selenium-webdriver'

#Capybara.default_driver = :selenium // Enable for firefox
Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :firefox)
end
