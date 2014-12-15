Feature: record manager views records sorted by last name descending

  As a record manager
  I want to view records sorted by last name descending

  Scenario: view records sorted by last name descending
    Given I have input the records "Chandra\nRue\nHart\n"
    When My records are sorted
    Then I should see 'Rue'
      And I should see 'Hart'
      And I should see 'Chandra'
