Feature: Record manager sorts by last name descending

  As a record manager
  I want to sort records by last name descending
  So that I can make sense of my data

  Scenario: Pipe-delimited record set
    Given I have chosen to sort by last name descending
      And my files contain
      """
      Chandra | Mick | M | Red | 9/14/1953
      Rue | Sandra | F | Blue | 12/1/1977
      Hart | Gershwin | F | Blue | 7/14/1984
      """
    When I run the application
    Then I should see
      """
      Rue Sandra F Blue 12/1/1977
      Hart Gershwin F Blue 7/14/1984
      Chandra Mick M Red 9/14/1953
      """

  Scenario: Comma-delimited record set
    Given I have chosen to sort by last name descending
      And my files contain
      """
      Chandra, Mick, M, Red, 9/14/1953
      Rue, Sandra, F, Blue, 12/1/1977
      Hart, Gershwin, F, Blue, 7/14/1984
      """
    When I run the application
    Then I should see
      """
      Rue Sandra F Blue 12/1/1977
      Hart Gershwin F Blue 7/14/1984
      Chandra Mick M Red 9/14/1953
      """

  Scenario: Space-delimited record set
    Given I have chosen to sort by last name descending
      And my files contain
      """
      Chandra Mick M Red 9/14/1953
      Rue Sandra F Blue 12/1/1977
      Hart Gershwin F Blue 7/14/1984
      """
    When I run the application
    Then I should see
      """
      Rue Sandra F Blue 12/1/1977
      Hart Gershwin F Blue 7/14/1984
      Chandra Mick M Red 9/14/1953
      """

  Scenario: Mixed-format record set
    Given I have chosen to sort by last name descending
      And my files contain
      """
      Chandra | Mick | M | Red | 9/14/1953
      Rue, Sandra, F, Blue, 12/1/1977
      Hart Gershwin F Blue 7/14/1984
      """
    When I run the application
    Then I should see
      """
      Rue Sandra F Blue 12/1/1977
      Hart Gershwin F Blue 7/14/1984
      Chandra Mick M Red 9/14/1953
      """
