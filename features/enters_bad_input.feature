Feature: Record manager enters bad input

  As a record manager
  I want bad input to be handled
  So that I can understand my mistake

  Scenario: Enter bad instruction
    Given I have chosen the bad sorting instruction "middle-name"
    When I run the application
    Then I should see "Unrecognized instruction: middle-name"

  Scenario Outline: Enter bad filename
    Given I have chosen to sort by <method>
      And I have chosen the non-existent file "my_fikle.txt"
    When I run the application
    Then I should see "Could not read file: my_fikle.txt"

    Examples:
      |        method        |
      |      birth date      |
      | gender and last name |
      | last name descending |
