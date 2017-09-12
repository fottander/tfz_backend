Feature: Create riders
  As an admin
  In order to stream videos from riders to the visitors
  I would like to be able to create rider pages

  Background:
    Given the following users exist
      | email         | password  | role  |
      | felix@tfz.com | 12345678  | admin |
    Given the following riders exist
      | name  | ytlink  | vimeolink           |
      | Felix | UU2323H | vimeo.com/felix     |

  Scenario: I create a rider page
    Given I am logged in as "felix@tfz.com"
    Given I am on the riders page
    Then I should see "Rider index"
    Then I should see "Felix"
    Then I should see "UU2323H"
    Then I should see "vimeo.com/felix"
    And I click "Add rider"
    Then I should see "Add information about the rider"
    And I fill in "Name" with "Fisken"
    And I fill in "Youtube link" with "UU3434"
    And I fill in "Vimeo link" with "vimeo.com/fisken"
    And I click "Submit"
    Then I should see "New rider added"
    Given I am on the riders page
    Then I should see "Fisken"
    And I should see "UU3434"
    And I should see "vimeo.com/fisken"
