Feature: Admin login
  As an admin
  In order to administrate the application
  I would like to be able to login

  Background:
  Given the following users exist
    | email         | password  | role  |
    | felix@tfz.com | 12345678  | admin |

  Scenario: I login as an admin
    Given I am on the root page
    And I fill in "Email" with "felix@tfz.com"
    And I fill in "Password" with "12345678"
    And I click "Log in"
    Then "felix@tfz.com" should be marked as "admin"
