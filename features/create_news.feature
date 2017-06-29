Feature: Create news
  As a visitor
  In order to update visitors with interesting news
  I would like to be able to create news articles

  Scenario: I create a news article
    Given I am on the news page
    And I click "Create news article"
    Then I should see "Create a new article"
    And I fill in "Title" with "Scooby doo"
    And I fill in "Content" with "This article is about scooby doo"
    And I click "Submit"
    Then I should see "News article created!"
