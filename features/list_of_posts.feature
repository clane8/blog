Feature: List of posts
  As a reader
  I want to read posts from my favorite blogger
  So that I can learn something

  Scenario: See published post
  	Given I have submitted a valid post
    When I am on the post listings page
  	Then the post is available

  Scenario: Post listings titles
    Given I have submitted a valid post
  	When I am on the post listings page
  	Then the posts should have titles

  Scenario: Post listings author
    Given I have submitted a valid post
    When I am on the post listings page
    Then the posts should show the authors name


  Scenario: Access create post page from home
    Given I have submitted a valid post
    When I am on the post listings page
    And I click the create a post button
    Then I am taken to the create a post page
