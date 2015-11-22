require_relative '../../app/exceptions/non_existing_user_error'
require_relative '../../app/exceptions/wrong_password_error'
require_relative '../../app/exceptions/blocked_account_error'

Given(/^the account with name "(.*?)" with email: "(.*?)" and password: "(.*?)"$/) do |arg1, arg2, arg3|
  visit '/register'
  fill_in('user[name]', :with => arg1)
  fill_in('user[email]', :with => arg2)
  fill_in('user[password]', :with => arg3)
  fill_in('user[password_confirmation]', :with => arg3)
  click_button('Create')  
end

Given(/^the login page$/) do
  visit '/login'
end

When(/^I insert the email "(.*?)"$/) do |arg1|
  fill_in('user[email]', with: arg1)
end

When(/^I insert the password "(.*?)"$/) do |arg1|
  fill_in('user[password]', with: arg1)
end

When(/^login$/) do
  click_button('Login')
end

Then(/^I should see an error message "(.*?)"$/) do |arg1|
  page.should have_content(arg1)
end
