Feature: Record manager enters bad instruction

  As a record manager
  I want bad instructions to be handled
  So that I can understand my mistake

  Scenario: Enter bad instruction
    Given I have chosen the bad sorting instruction "middle-name"
    When I run the application
    Then I should see "Unrecognized instruction: middle-name"
