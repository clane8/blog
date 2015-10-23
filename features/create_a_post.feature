Feature: Create a post
  As an author
  I want to reate a blog post
  So that I can share my knowledge with the world

  Scenario: Creating a valid post
    Given I am on the post submission page
    When I create a valid post
    Then my post is created

  Scenario: Creating an invalid post
  	Given I am on the post submission page
  	When I create an invalid post
  	Then I am given an error

  Scenario: Canceling a post
  	Given I am on the post submission page
  	When I select the cancel button
  	Then I am given a cancel page

  Scenario: Create a duplicate post
    Given I am on the post submission page
    When I create a duplicate post
    Then I am given a duplicate error