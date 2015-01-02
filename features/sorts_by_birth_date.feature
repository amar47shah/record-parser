Feature: Record manager sorts by birth date

  As a record manager
  I want to sort records by birth date
  So that I can make sense of my data

  Scenario: Pipe-delimited record set
    Given I have chosen to sort by birth date
      And my files contain
      """
      Baczyk | Bran | M | Yellow | 9/14/1984
      Alnouri | Sami | F | Black | 12/1/1984
      Hart | Gershwin | F | Blue | 7/14/1984
      Chandra | Mick | M | Red | 9/14/1953
      Robson | Fenley | F | Purple | 7/4/1984
      """
    When I run the application
    Then I should see
      """
      Chandra Mick M Red 9/14/1953
      Robson Fenley F Purple 7/4/1984
      Hart Gershwin F Blue 7/14/1984
      Baczyk Bran M Yellow 9/14/1984
      Alnouri Sami F Black 12/1/1984
      """

  Scenario: Comma-delimited record set
    Given I have chosen to sort by birth date
      And my files contain
      """
      Baczyk, Bran, M, Yellow, 9/14/1984
      Alnouri, Sami, F, Black, 12/1/1984
      Hart, Gershwin, F, Blue, 7/14/1984
      Chandra, Mick, M, Red, 9/14/1953
      Robson, Fenley, F, Purple, 7/4/1984
      """
    When I run the application
    Then I should see
      """
      Chandra Mick M Red 9/14/1953
      Robson Fenley F Purple 7/4/1984
      Hart Gershwin F Blue 7/14/1984
      Baczyk Bran M Yellow 9/14/1984
      Alnouri Sami F Black 12/1/1984
      """

  Scenario: Space-delimited record set
    Given I have chosen to sort by birth date
      And my files contain
      """
      Baczyk Bran M Yellow 9/14/1984
      Alnouri Sami F Black 12/1/1984
      Hart Gershwin F Blue 7/14/1984
      Chandra Mick M Red 9/14/1953
      Robson Fenley F Purple 7/4/1984
      """
    When I run the application
    Then I should see
      """
      Chandra Mick M Red 9/14/1953
      Robson Fenley F Purple 7/4/1984
      Hart Gershwin F Blue 7/14/1984
      Baczyk Bran M Yellow 9/14/1984
      Alnouri Sami F Black 12/1/1984
      """
