Feature: Web client posts record

  As a web developer
  I want to post a new record
  so that it will be added to the data store

  Scenario Outline: Post record
    Given the API store is open
    When the web client POSTs <record>
    Then the API store should contain <record>
     And <record> should be written to the file

    Examples:
      |                   record                   |
      |       Cross Dagmar F Blue 11/28/1968       |
      |     Cross, Dagmar, F, Blue, 11/28/1968     |
      | Cross \| Dagmar \| F \| Blue \| 11/28/1968 |
