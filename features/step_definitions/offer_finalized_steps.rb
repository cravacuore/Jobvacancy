Given(/^I go the login page$/) do
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

When(/^I press button Finalize in the offer "(.*?)"$/) do |my_offer|
	#click_button('Finalize')
	#page.should have_content('false')
end

Then(/^the public can not see the offer "(.*?)"$/) do |my_offer|
end