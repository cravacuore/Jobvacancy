Given(/^that Offers Job should have at least one offer$/) do
  visit '/'

  visit '/login'
  fill_in('user[email]', :with => 'offerer@test.com')
  fill_in('user[password]', :with => 'Passw0rd!')
  click_button('Login')

  visit '/job_offers/new'
  fill_in('job_offer[title]', :with => 'Programmer Ruby')
  fill_in('job_offer[location]', :with => 'Quilmes')
  fill_in('job_offer[description]', :with => 'Good ambient job')
  click_button('Create')
  visit '/job_offers/latest'
end

Given(/^one offer that contains "(.*?)" in Title, "(.*?)" in Location and "(.*?)" in Description$/) do |title, name_city, description|
  page.should have_content('Title')
  page.should have_content(title)
  page.should have_content('Location')
  page.should have_content(name_city)
  page.should have_content('Description')
  page.should have_content(description)
end

When(/^I search "(.*?)"$/) do |name_city|
  fill_in('q', :with => name_city)
  click_button('search-button')
end

Then(/^I should see this offer with Location "(.*?)"$/) do |name_city|
  page.should have_content(name_city)
end

#############################################################################

Then(/^I should see this offer with Description containing "(.*?)"$/) do |query|
  page.should have_content(query)
end

#############################################################################

Then(/^I should see this offer with Title containing "(.*?)"$/) do |query|
  page.should have_content(query)
end

