Feature: record manager inputs file

  As a record manager
  I want to input a file
  so that I can parse and sort records

  Scenario: input file
    Given I have not started a session
    When I start a session with a file called 'data/records.txt'
    Then I should see 'Welcome to the Record Parser'
    Then I should see 'Parsing data/records.txt'
