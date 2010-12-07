Feature: Facebook info

  Scenario: My profile
    Given I am logged in
    When I go to my profile
    Then I should see my photo
    And I should see "Joe Smith"
    And I should see "I am awesome!!!"
