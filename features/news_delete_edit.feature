Feature: Delete and edit a news post
  As an admin
  In order to manage the news flow and old posts
  I would like to be able to delete and edit news posts

  Background:
    Given the following news exist
     | title                   | content                                           | file               |
     | Awesome travel insights | Let me tell you about my trip to British Columbia | Agile_workflow.png |

  Scenario: I delete a news post
    Given I am on the news page
    Then I should see "Awesome travel insights"
    And I click "Delete post"
    And I should see "News post deleted"
    Then I should not see "Awesome travel insights"

  Scenario: I edit a news post
    Given I am on the news page
    Then I should see "Awesome travel insights"
    And I click "Edit post"
    Then I should see "Edit your news post"
