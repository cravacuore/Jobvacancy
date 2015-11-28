Given(/^I am in the login page$/) do
  visit '/register'
  fill_in('user[name]', :with => 'Usuario')
  fill_in('user[email]', :with => 'user@gmail.com')
  fill_in('user[password]', :with => 'UserPassword123')
  fill_in('user[password_confirmation]', :with => 'UserPassword123')
  click_button('Create')
  page.should have_content('User created')
  visit '/login'
end

Given(/^I log in account email: "(.*?)" and password: "(.*?)"$/) do |arg1, arg2|
  fill_in('user[email]', :with => arg1)
  fill_in('user[password]', :with => arg2)
  click_button('Login')
end

Given(/^I go the new offer page$/) do
  visit '/job_offers/new'
end

Given(/^create one offer, with title: "(.*?)" and location: "(.*?)"$/) do |arg1, arg2|
  fill_in('job_offer[title]', :with => arg1)
  fill_in('job_offer[location]', :with => arg2)
  click_button('Create')
  page.should have_content('Offer created')
end

Given(/^the my offers page$/) do
  visit '/job_offers/my'
end

When(/^I click link Finalize$/) do
  click_link('Finalize')
end

Then(/^should see the title "(.*?)"$/) do |arg1|
  page.should have_content(arg1)
end

When(/^I select option "(.*?)"$/) do |arg1|
  select(arg1, from: 'reason')
end

When(/^click button Finalize$/) do
  click_button('Finalize')
end

Then(/^should see the message "(.*?)"$/) do |arg1|
  page.should have_content(arg1)
end
