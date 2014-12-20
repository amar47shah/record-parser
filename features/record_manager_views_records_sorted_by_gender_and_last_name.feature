Feature: record manager views records sorted by gender and last name

  As a record manager
  I want to view records sorted by gender and last name

  Scenario: view records sorted by gender and last name
    Given I have input the records
      """
      Robson Marcus M Green 08/25/1989
      Rue Sandra F Blue 12/01/1977
      Chandra Mick M Red 09/14/1953
      Hart Gershwin F Blue 07/12/1984
      """
    When I choose "Sort by gender and last name."
    Then I should see
      """
      Hart Gershwin F Blue 07/12/1984
      Rue Sandra F Blue 12/01/1977
      Chandra Mick M Red 09/14/1953
      Robson Marcus M Green 08/25/1989
      """
