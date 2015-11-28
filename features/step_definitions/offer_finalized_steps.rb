Given(/^I go the login page$/) do
  visit '/register'
  fill_in('user[name]', :with => 'Brian Pericon')
  fill_in('user[email]', :with => 'brian@gmail.com')
  fill_in('user[password]', :with => 'Pericon92')
  fill_in('user[password_confirmation]', :with => 'Pericon92')
  click_button('Create')
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
end

Given(/^I access the my offers page$/) do
  visit '/job_offers/my'
end

When(/^I press button Finalize in the offer "(.*?)"$/) do |arg1|
  click_button('Finalize')
end

Then(/^the offer show one column of name "(.*?)"$/) do |arg1|
  page.should have_content(arg1)
end

When(/^I select option "(.*?)"$/) do |arg1|
  select(arg1, from: 'reason')
end

Then(/^should see the message "(.*?)"$/) do |arg1|
  page.should have_content(arg1)
end
