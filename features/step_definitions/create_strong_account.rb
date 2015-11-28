Given(/^I am in the register page$/) do
   visit '/register'
end

When(/^I fill the name with "(.*?)"$/) do |arg1|
  fill_in('user[name]', :with => arg1)
end

And(/^I fill the email with "(.*?)"$/) do |arg1|
  fill_in('user[email]', :with => arg1)
end

And(/^I fill the password with "(.*?)"$/) do |arg1|
  fill_in('user[password]', :with => arg1)
end

And(/^I fill the password confirmation with "(.*?)"$/) do |arg1|
  fill_in('user[password_confirmation]', :with => arg1)
end

And(/^click in create$/) do
  click_button('Create')
end

