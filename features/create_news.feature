Feature: Create news
  As an admin
  In order to update visitors with interesting news
  I would like to be able to create news articles

  Background:
  Given the following users exist
    | email         | password  | role  |
    | felix@tfz.com | 12345678  | admin |
  Given the following news exist
   | title                   | content                                           | file               |
   | Awesome travel insights | Let me tell you about my trip to British Columbia | Agile_workflow.png |

  Scenario: I create a news article
    Given I am logged in as "felix@tfz.com"
    Given I am on the news page
    Then I should see "Awesome travel insights"
    And I should see "Let me tell you about my trip to British Columbia"
    And I should see "Awesome travel insights" file name "Agile_workflow.png"
    And I click "Create news article"
    Then I should see "Create a new article"
    And I fill in "Title" with "Scooby doo"
    And I fill in "Content" with "This article is about scooby doo"
    And I attach file
    And I click "Submit"
    Then I should see "News article created!"
    Given I am on the news page
    Then I should see "Scooby doo" file name "Agile_workflow.png"
