Given(/^the login page$/) do
	visit '/login'
end

Given(/^the account with email: "(.*?)" and password: "(.*?)"$/) do |arg1, arg2|
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