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
  @old_description = description
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

Given(/^I duplicate the offer$/) do
  click_link('Duplicate')
end

Given(/^I change the Description with "(.*?)"$/) do |description|
  @new_description = description
  fill_in('job_offer[description]', :with => description)
end

Given(/^I Create the offer$/) do
  click_button('Create')
end

Then(/^I should have (\d+) "(.*?)" offers$/) do |arg1, arg2|
  page.should have_content(@new_description)
  page.should have_content(@old_description)
end