Feature: Record manager starts sorter

  As a record manager
  I want to input a file and choose a sorting method
  so that I can view my sorted records

  Scenario Outline: Start sorter
    Given I have not started the sorter
    When I choose to sort by <method>
      And I input a file called 'data/records.txt'
    Then I should see 'data/records.txt sorted by <method>:'

  Examples:
    |        method        |
    | last name descending |
    | gender and last name |
