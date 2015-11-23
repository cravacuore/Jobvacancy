Given(/^I go the login page$/) do
	visit '/'

  visit '/register'
  fill_in('user[name]', :with => 'Brian Pericon')
  fill_in('user[email]', :with => 'brian@gmail.com')
  fill_in('user[password]', :with => 'Pericon92')
  fill_in('user[password_confirmation]', :with => 'Pericon92')
  click_button('Create')

  visit '/login'
end

Given(/^I log in account email: "(.*?)" and password: "(.*?)"$/) do |email, password|
  fill_in('user[email]', :with => email)
  fill_in('user[password]', :with => password)
  click_button('Login')
end

Given(/^I go the new offer page$/) do
	visit '/job_offers/new'
end

Given(/^create one offer, with title: "(.*?)" and location: "(.*?)"$/) do |title, location|
	fill_in('job_offer[title]', :with => title)
  fill_in('job_offer[location]', :with => location)
  click_button('Create')
end

Given(/^I access the my offers page$/) do
	visit '/job_offers/my'
end

Given(/^I press button Finalize in the offer "(.*?)"$/) do |my_offer|
	click_button('Finalize')
  page.should have_content(my_offer)
	page.should have_content('false')
end

Then(/^the offer show one column of name "(.*?)"$/) do |title_column|
  page.should have_content(title_column)
end

Given(/^I press button "(.*?)" in the offer "Java development"$/) do |option|
  click_button(option)
end

Then(/^should see the message "(.*?)"$/) do |message|
  page.should have_content(message)
end
