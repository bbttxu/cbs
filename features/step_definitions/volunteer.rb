# volunteer.rb

Given /^a volunteer shows to the shop$/ do
	# for now nothing, but we might logout any existing user
	true
end

When /^they visit the website$/ do
	visit "/"
end

When /^they enter their email address$/ do
	fill_in :email, :with => :bbttxu
end

When /^click "(.*?)"$/ do |arg1|
	click_on arg1
end

Then /^they will see "(.*?)"$/ do |arg1|
	page.has_content arg1
end