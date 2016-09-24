require 'selenium-webdriver'
require 'securerandom'
require 'capybara-screenshot/cucumber'
random_string = SecureRandom.hex
driver = Selenium::WebDriver.for :firefox
puts driver.manage.window.size
target_size = Selenium::WebDriver::Dimension.new(1024, 768)
driver.manage.window.size = target_size
puts driver.manage.window.size


Given(/^I am on the demoqa homepage$/) do
  driver.get "http://demoqa.com"
time = Time.now.strftime('%a_%e_%Y_%l_%m_%p_%M')

    file_path = File.expand_path(File.dirname(__FILE__) + '/../../screenshots')+'/'+time +'.png'

    driver.save_screenshot file_path
end

When(/^I will click the registration button$/) do
   driver.find_element(:id, "menu-item-374").click
end

Then(/^I expect to see the registration form$/) do
sleep 5  
element = driver.find_element(:id, "piereg_pie_form_heading")
end

Then(/^I will fill in the form and click Submit$/) do
driver.find_element(:id, "name_3_firstname").clear
    driver.find_element(:id, "name_3_firstname").send_keys "firstname"
    driver.find_element(:id, "name_3_lastname").clear
    driver.find_element(:id, "name_3_lastname").send_keys "lastname"
    driver.find_element(:xpath, "(//input[@name='radio_4[]'])[2]").click
    driver.find_element(:name, "checkbox_5[]").click
    driver.find_element(:id, "phone_9").clear
    driver.find_element(:id, "phone_9").send_keys "3123123121"
    driver.find_element(:id, "email_1").clear
    driver.find_element(:id, "email_1").send_keys "user#{random_string}@google.com"
    driver.find_element(:id, "description").clear
    driver.find_element(:id, "description").send_keys "test"
    driver.find_element(:id, "password_2").clear
    driver.find_element(:id, "password_2").send_keys "test123"
    driver.find_element(:id, "confirm_password_password_2").clear
    driver.find_element(:id, "confirm_password_password_2").send_keys "test123321"
    driver.find_element(:id, "password_2").clear
    driver.find_element(:id, "password_2").send_keys "test123321"
    driver.find_element(:id, "password_2").clear
    driver.find_element(:id, "password_2").send_keys "Test123321"
    driver.find_element(:id, "confirm_password_password_2").clear
    driver.find_element(:id, "confirm_password_password_2").send_keys "Test123321"
    driver.find_element(:name, "pie_submit").click
    driver.find_element(:id, "username").clear
    driver.find_element(:id, "username").send_keys "#{random_string}"
    sleep 10
    driver.find_element(:name, "pie_submit").click
end

Then(/^my account is created$/) do
  element = driver.find_element(:class, "piereg_message")
end

After do |scenario| 
    if(scenario.failed?)
        puts "after step is executed"
    end
    time = Time.now.strftime('%a_%e_%Y_%l_%m_%p_%M')

    file_path = File.expand_path(File.dirname(__FILE__) + '/../../screenshots')+'/'+time +'.png'

    page.driver.browser.save_screenshot file_path
end

Given /^snapshot$/ do
    time = Time.now.strftime('%a_%e_%Y_%l_%m_%p_%M')

    file_path = File.expand_path(File.dirname(__FILE__) + '/../../screenshots')+'/'+time +'.png'
    page.driver.browser.save_screenshot file_path
end
