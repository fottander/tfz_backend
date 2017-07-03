Feature: Admin login
  As an admin
  In order to administrate the application
  I would like to be able to login

  Background:
  Given the following users exist
    | email         | password  | password_confirmation |
    | felix@tfz.com | 12345678  | 12345678              |

  Scenario: I login as an admin
    Given I am on the root page
    And I fill in "Email" with "felix@tfz.com"
    And I select "admin" from "Role"
    And I fill in "Password" with "12345678"
    And I fill in "Password confirmation" with "12345678"
    And I click "Sign up"
    And I should see "You have signed up successfully."
    Then "felix@tfz" should be marked as "admin"
