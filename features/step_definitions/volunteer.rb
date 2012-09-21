# volunteer.rb

Given /^a volunteer shows to the shop$/ do
	# for now nothing, but we might logout any existing user
	true
end

When /^they visit the website$/ do
	visit "/"
end

When /^they enter their email address$/ do
  pending # express the regexp above with the code you wish you had
end

When /^click "(.*?)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then /^they will see "(.*?)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end