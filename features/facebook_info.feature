Feature: Facebook info

  Scenario: My profile
    Given I am logged in
    When I go to my profile
    Then I should see my Facebook photo
    And I should see my Facebook name
    And I should see my Facebook bio
