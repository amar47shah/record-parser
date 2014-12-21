Feature: Record manager views sorted records

  As a record manager
  I want to view sorted records
  So that I can make sense of my data

  Scenario: By last name descending
    Given I have chosen to sort by last name descending
      And I have input the records
        """
        Chandra Mick M Red 09/14/1953
        Rue Sandra F Blue 12/01/1977
        Hart Gershwin F Blue 07/12/1984
        """
    When I view the sorted records
    Then I should see
      """

      Sorted by last name descending:
      Rue Sandra F Blue 12/01/1977
      Hart Gershwin F Blue 07/12/1984
      Chandra Mick M Red 09/14/1953
      """

  Scenario: By gender and last name
    Given I have chosen to sort by gender and last name
      And I have input the records
        """
        Robson Marcus M Green 08/25/1989
        Rue Sandra F Blue 12/01/1977
        Chandra Mick M Red 09/14/1953
        Hart Gershwin F Blue 07/12/1984
        """
    When I view the sorted records
    Then I should see
      """

      Sorted by gender and last name:
      Hart Gershwin F Blue 07/12/1984
      Rue Sandra F Blue 12/01/1977
      Chandra Mick M Red 09/14/1953
      Robson Marcus M Green 08/25/1989
      """
