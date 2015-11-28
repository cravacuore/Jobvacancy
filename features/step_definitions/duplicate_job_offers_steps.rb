Given(/^the account with Name "(.*?)", email "(.*?)" and password "(.*?)"$/) do |name, email, password|
  visit '/register'
  fill_in('user[name]', :with => name)
  fill_in('user[email]', :with => email)
  fill_in('user[password]', :with => password)
  fill_in('user[password_confirmation]', :with => password)
  click_button('Create')

  page.should have_content('User created')
end

Given(/^I am logged in with the email "(.*?)" and password "(.*?)"$/) do |email, password|
  visit '/login'
  fill_in('user[email]', :with => email)
  fill_in('user[password]', :with => password)
  click_button('Login')

  page.should have_content(email)
end

Given(/^I have an offer in My Offers with Title "(.*?)", Location "(.*?)", Description "(.*?)", Benefits "(.*?)"$/) do |title, name_city, description, benefits|
  visit '/job_offers/new'
  fill_in('job_offer[title]', :with => title)
  fill_in('job_offer[location]', :with => name_city)
  fill_in('job_offer[description]', :with => description)
  fill_in('job_offer[benefits]', :with => benefits)
  click_button('Create')

  page.should have_content(title)
  page.should have_content(name_city)
  page.should have_content(description)
  page.should have_content(benefits)
end

Given(/^I access the My Offers page$/) do
  visit '/job_offers/my'
end

Then(/^I should see a button "(.*?)"$/) do |button|
  page.should have_content(button)
end

Given(/^I duplicate the offer$/) do
  click_button('Duplicate')
end

Then(/^I should see in Title "(.*?)"$/) do |title|
  page.should have_content(title)
end

Then(/^I should see in Location "(.*?)"$/) do |name_city|
  page.should have_content(name_city)
end

Then(/^I should see in Description "(.*?)"$/) do |description|
  page.should have_content(description)
end

Then(/^I should see in Benefits "(.*?)"$/) do |benefits|
  page.should have_content(benefits)
end

Then(/^I set Description to "(.*?)"$/) do |description|
    fill_in('job_offer[description]', :with => description)
end
