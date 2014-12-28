Feature: Record manager sorts by gender and last name

  As a record manager
  I want to sort records by gender and last name
  So that I can make sense of my data

  Scenario: Sort by gender and last name
    Given I have chosen to sort by gender and last name:
        """
        Robson Marcus M Green 08/25/1989
        Rue Sandra F Blue 12/01/1977
        Chandra Mick M Red 09/14/1953
        Hart Gershwin F Blue 07/12/1984
        """
    When my records are sorted
    Then I should see
      """
      Hart Gershwin F Blue 07/12/1984
      Rue Sandra F Blue 12/01/1977
      Chandra Mick M Red 09/14/1953
      Robson Marcus M Green 08/25/1989
      """
