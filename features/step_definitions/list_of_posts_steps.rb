$post_number = 1

Given /^I have submitted a valid post$/ do 
  @page_home = HomePage.new @browser
  @page_home.goto
  @page_home.new_post
  @page_create = CreationPage.new @browser
  @page_create.valid_post_to_home
  @page_create.submit_post
  
  $post_number = $post_number + 1
end

When /^I am on the post listings page$/ do
  @page_home.go_home
end

Then /^the post is available$/ do
  expect(@page_home.html).to include("This is the body of the post to check the existence of on the home page")
end


Then /^the posts should have titles$/ do
  expect(@page_home.html).to include("My Blog Title")
end


Then /^the posts should show the authors name$/ do
  expect(@page_home.html).to include("Corby Lane")
  #check for author name
end

And /^I click the create a post button$/ do
  @page_home.new_post
  #select create post button
end

Then /^I am taken to the create a post page$/ do
  expect(@page_home.html).to include("New Post Entry")
  #expect to create a post page title
end
