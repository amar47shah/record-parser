Feature: record manager views records sorted by last name descending

  As a record manager
  I want to view records sorted by last name descending

  Scenario: view records sorted by last name descending
    Given I have input the records
      """
      Chandra
      Rue
      Hart
      """
    When My records are sorted
    Then I should see
      """
      Rue
      Hart
      Chandra
      """
