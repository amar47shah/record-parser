Feature: Record manager sorts by gender and last name

  As a record manager
  I want to sort records by gender and last name
  So that I can make sense of my data

  Scenario: Pipe-delimited record set
    Given I have chosen to sort by gender and last name
      And my files contain
      """
      Robson | Marcus | M | Green | 8/25/1989
      Rue | Sandra | F | Blue | 12/1/1977
      Chandra | Mick | M | Red | 9/14/1953
      Hart | Gershwin | F | Blue | 7/14/1984
      """
    When I run the application
    Then I should see
      """
      Hart Gershwin F Blue 7/14/1984
      Rue Sandra F Blue 12/1/1977
      Chandra Mick M Red 9/14/1953
      Robson Marcus M Green 8/25/1989
      """

  Scenario: Comma-delimited record set
    Given I have chosen to sort by gender and last name
      And my files contain
      """
      Robson, Marcus, M, Green, 8/25/1989
      Rue, Sandra, F, Blue, 12/1/1977
      Chandra, Mick, M, Red, 9/14/1953
      Hart, Gershwin, F, Blue, 7/14/1984
      """
    When I run the application
    Then I should see
      """
      Hart Gershwin F Blue 7/14/1984
      Rue Sandra F Blue 12/1/1977
      Chandra Mick M Red 9/14/1953
      Robson Marcus M Green 8/25/1989
      """

  Scenario: Space-delimited record set
    Given I have chosen to sort by gender and last name
      And my files contain
      """
      Robson Marcus M Green 8/25/1989
      Rue Sandra F Blue 12/1/1977
      Chandra Mick M Red 9/14/1953
      Hart Gershwin F Blue 7/14/1984
      """
    When I run the application
    Then I should see
      """
      Hart Gershwin F Blue 7/14/1984
      Rue Sandra F Blue 12/1/1977
      Chandra Mick M Red 9/14/1953
      Robson Marcus M Green 8/25/1989
      """

  Scenario: Mixed-format record set
    Given I have chosen to sort by gender and last name
      And my files contain
      """
      Robson Marcus M Green 8/25/1989
      Rue, Sandra, F, Blue, 12/1/1977
      Chandra Mick M Red 9/14/1953
      Hart | Gershwin | F | Blue | 7/14/1984
      """
    When I run the application
    Then I should see
      """
      Hart Gershwin F Blue 7/14/1984
      Rue Sandra F Blue 12/1/1977
      Chandra Mick M Red 9/14/1953
      Robson Marcus M Green 8/25/1989
      """
