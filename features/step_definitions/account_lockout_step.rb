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

When(/^I insert the email "(.*?)"$/) do |my_email|
	fill_in('user[email]', with: my_email)
end

When(/^I insert the password "(.*?)"$/) do |my_password|
  fill_in('user[password]', with: my_password)
end

When(/^login$/) do
	click_button('Login')
end

Then(/^I should see an error message "(.*?)"$/) do |error_message|
  page.should have_content(error_message)
end

Then(/^my account has to be blocked\.$/) do
  pending # express the regexp above with the code you wish you had
end