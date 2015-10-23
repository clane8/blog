Feature: Read a post
  As a reader
  I want to read an entire post
  So that I can get all the details


  Scenario: Access post page from home
    Given I am on the home page of posts
    When I click on a post title
    Then The post page is opened

  Scenario: Viewing a single post
  	Given I am on a post page
   # When I select a post
  	Then the entire post is visible
  	And the post shows the author's name
  	And the post shows the title
  	And there is a link to home