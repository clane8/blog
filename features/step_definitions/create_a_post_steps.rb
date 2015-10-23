Given /^I am on the post submission page$/ do
  @page = CreationPage.new @browser
  @page.goto
end

When /^I create a valid post$/ do
  @page.create_valid_post
  @page.submit_post
end

Then /^my post is created$/ do
  expect(@page.html).to include("Submitted!")
end

When /^I create an invalid post$/ do
	@page.create_invalid_post
	@page.submit_post
end

Then /^I am given an error$/ do
	expect(@page.html).to include("Error! You left a field blank.")
end

When /^I select the cancel button$/ do
	@page.cancel_post
end

Then /^I am given a cancel page$/ do
	expect(@page.html).to include("Post canceled!")
	#return to home page
end

When /^I create a duplicate post$/ do
	@page.create_duplicate_post
	@page.goto
	@page.create_duplicate_post
	#do stuff
end

Then /^I am given a duplicate error$/ do
	expect(@page.html).to include("Error! No duplicates!")
end

