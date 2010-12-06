Feature: Users

  Scenario: signup
    Given I go to the signup page
    When I fill in "Email" with "ben@t.apio.ca"
    And I fill in "Password" with "secret"
    And I fill in "Password confirmation" with "secret"
    And I press "Sign up"
    Then I should be on the home page
    And I should see "ben@t.apio.ca"
    And I should see "Sign out"
