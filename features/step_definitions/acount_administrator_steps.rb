Given(/^one account email: "(.*?)" and password: "(.*?)"$/) do |email, password|
	visit '/'

	visit '/register'
  fill_in('user[name]', :with => 'Admin')
  fill_in('user[email]', :with => email)
  fill_in('user[password]', :with => password)
  fill_in('user[password_confirmation]', :with => password)
  click_button('Create')  
end

When(/^fill fields with email: "(.*?)" and password: "(.*?)"$/) do |email, password|
	visit '/login'
  fill_in('user[email]', :with => email)
  fill_in('user[password]', :with => password)
end

When(/^press button "(.*?)"$/) do |login|
	click_button('Login')
  page.should have_content('admin@admin.com')
end

Then(/^login as administrator should see message "(.*?)"$/) do |message|
	page.should have_content(message)
end
