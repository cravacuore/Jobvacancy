Given(/^only a "(.*?)" offer exists in the offers list$/) do | job_title |
  @job_offer = JobOffer.new
  @job_offer.owner = User.first
  @job_offer.title = job_title
  @job_offer.location = 'a nice job'
  @job_offer.description = 'a nice job'
  @job_offer.save
end

Given(/^I access the offers list page$/) do
  visit '/job_offers'
end

Given(/^I access to the offer page$/) do
  visit '/job_offers/apply/1'
end

Given(/^put "(.*?)", "(.*?)" and "(.*?)"$/) do |arg1, arg2, arg3|
  complete_fields(arg1, arg2, arg3)
end

When(/^I apply$/) do
  click_link('Apply')
end

When(/^apply$/) do
  click_button('Apply')
end

Then(/^I should put "(.*?)", "(.*?)" and "(.*?)"$/) do |arg1, arg2, arg3|
  complete_fields(arg1, arg2, arg3)  
end

Then(/^I should receive a mail with offerer info$/) do
  mail_store = "#{Padrino.root}/tmp/emails"
  file = File.open("#{mail_store}/applicant@test.com", "r")
  content = file.read
  content.include?(@job_offer.title).should be true
  content.include?(@job_offer.location).should be true
  content.include?(@job_offer.description).should be true
  content.include?(@job_offer.owner.email).should be true
  content.include?(@job_offer.owner.name).should be true
end

def complete_fields(arg1, arg2, arg3)
  fill_in('job_application[applicant_email]', :with => arg1)
  fill_in('job_application[applicant_name]', :with => arg2)
  fill_in('job_application[applicant_cv_link]', :with => arg3)
end