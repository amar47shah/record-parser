Feature: Record manager sorts by last name descending

  As a record manager
  I want to sort records by last name descending
  So that I can make sense of my data

  Scenario: Sort by last name descending
    Given I have chosen to sort by last name descending
      And I have input the records
        """
        Chandra Mick M Red 09/14/1953
        Rue Sandra F Blue 12/01/1977
        Hart Gershwin F Blue 07/12/1984
        """
    When my records are sorted
    Then I should see
      """

      Sorted by last name descending:
      Rue Sandra F Blue 12/01/1977
      Hart Gershwin F Blue 07/12/1984
      Chandra Mick M Red 09/14/1953
      """
