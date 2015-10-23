Given /^I am on the home page of posts$/ do
  @page_home = HomePage.new @browser
  @page_home.goto
end

When /^I click on a post title$/ do
  pending
  #select a title
  #I was trying to use a dynamic link in the app.rb. I didn't know how this would
  #be implemented so I tried to do that first. Turns out I can't do it that way with 
  #the way slim is being used.
end

Then /^The post page is opened$/ do
  pending
  #expect page to be on selected post
end

Given /^I select a post$/ do
  pending
  #select post from home
end

When /^the post page is loaded$/ do
  pending
  #expect entire post
end

Given /^I am on a post page$/ do
  pending
  #navigate to an existing post page
end

Then /^the entire post is visible$/ do
  pending
  # full post string is present
end

And /^the post shows the authors name$/ do
  expect(@page_home.html).to include("Corby Lane")
  #
end

And /^the post show the title$/ do
  expect(@page_home.html).to include("My Blog Title")
  #
end

And /^there is a link to home$/ do
  expect(@page_home.html).to include('<button id="go-home">Home</button>')
  #
end

