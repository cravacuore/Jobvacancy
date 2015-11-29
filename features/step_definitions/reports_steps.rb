Given(/^various offers finalized$/) do
	visit '/job_offers/new'

	fill_in('job_offer[title]', :with => 'Instructor Ruby')
  fill_in('job_offer[location]', :with => 'Bernal')
  click_button('Create')

  visit '/job_offers/my'
  click_link('Finalize')
  select('Hiring open', from: 'reason')
	click_button('Finalize')

	visit '/job_offers/new'

  fill_in('job_offer[title]', :with => 'Instructor Java')
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

Then(/^obtain a report$/) do
end
