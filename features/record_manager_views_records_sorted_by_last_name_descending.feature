Feature: record manager views records sorted by last name descending

  As a record manager
  I want to view records sorted by last name descending

  Scenario: view records sorted by last name descending
    Given I have input the records
      """
      Chandra Mick M Red 09/14/1953
      Rue Sandra F Blue 12/01/1977
      Hart Gershwin F Blue 07/12/1984
      """
    When My records are sorted
    Then I should see
      """
      Rue Sandra F Blue 12/01/1977
      Hart Gershwin F Blue 07/12/1984
      Chandra Mick M Red 09/14/1953
      """
