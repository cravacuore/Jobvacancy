Given(/^a offer finalized with "(.*?)"$/) do |arg1|
  visit '/job_offers/new'

  fill_in('job_offer[title]', :with => 'Instructor Ruby')
  fill_in('job_offer[location]', :with => 'Bernal')
  click_button('Create')

  visit '/job_offers/my'
  click_link('Finalize')
  select('Hiring open', from: 'reason')
  click_button('Finalize')
end

Given(/^the offers page$/) do
  visit '/job_offers/latest'
end

When(/^press button Report$/) do
  click_link('Report')
end
