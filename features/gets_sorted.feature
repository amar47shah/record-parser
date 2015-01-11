Feature: Web client gets sorted records as JSON

  As a web developer
  I want to retrieve sorted records as JSON
  so that I can use the data in my application

  Scenario: Sorted by birth date
    Given the API store contains
      """
      Baczyk Bran M Yellow 9/14/1984
      Alnouri Sami F Black 12/1/1984
      Hart Gershwin F Blue 7/14/1984
      Chandra Mick M Red 9/14/1953
      Robson Fenley F Purple 7/4/1984
      """
    When the web client requests GET /records/birthdate
    Then the response should be JSON:
      """
      [ {
          "last_name": "Chandra",
          "first_name": "Mick",
          "gender": "M",
          "favorite_color": "Red",
          "birth_date": "9/14/1953"
        },
        {
          "last_name": "Robson",
          "first_name": "Fenley",
          "gender": "F",
          "favorite_color": "Purple",
          "birth_date": "7/4/1984"
        },
        {
          "last_name": "Hart",
          "first_name": "Gershwin",
          "gender": "F",
          "favorite_color": "Blue",
          "birth_date": "7/14/1984"
        },
        {
          "last_name": "Baczyk",
          "first_name": "Bran",
          "gender": "M",
          "favorite_color": "Yellow",
          "birth_date": "9/14/1984"
        },
        {
          "last_name": "Alnouri",
          "first_name": "Sami",
          "gender": "F",
          "favorite_color": "Black",
          "birth_date": "12/1/1984"
        } ]
      """

  Scenario: Sorted by gender and last name
    Given the API store contains
      """
      Robson Marcus M Green 8/25/1989
      Rue Sandra F Blue 12/1/1977
      Chandra Mick M Red 9/14/1953
      Hart Gershwin F Blue 7/14/1984
      """
    When the web client requests GET /records/gender
    Then the response should be JSON:
      """
      [ {
          "last_name": "Hart",
          "first_name": "Gershwin",
          "gender": "F",
          "favorite_color": "Blue",
          "birth_date": "7/14/1984"
        },
        {
          "last_name": "Rue",
          "first_name": "Sandra",
          "gender": "F",
          "favorite_color": "Blue",
          "birth_date": "12/1/1977"
        },
        {
          "last_name": "Chandra",
          "first_name": "Mick",
          "gender": "M",
          "favorite_color": "Red",
          "birth_date": "9/14/1953"
        },
        {
          "last_name": "Robson",
          "first_name": "Marcus",
          "gender": "M",
          "favorite_color": "Green",
          "birth_date": "8/25/1989"
        } ]
      """

  Scenario: Sorted by last name descending
    Given the API store contains
      """
      Chandra Mick M Red 9/14/1953
      Rue Sandra F Blue 12/1/1977
      Hart Gershwin F Blue 7/14/1984
      """
    When the web client requests GET /records/name
    Then the response should be JSON:
      """
      [ {
          "last_name": "Rue",
          "first_name": "Sandra",
          "gender": "F",
          "favorite_color": "Blue",
          "birth_date": "12/1/1977"
        },
        {
          "last_name": "Hart",
          "first_name": "Gershwin",
          "gender": "F",
          "favorite_color": "Blue",
          "birth_date": "7/14/1984"
        },
        {
          "last_name": "Chandra",
          "first_name": "Mick",
          "gender": "M",
          "favorite_color": "Red",
          "birth_date": "9/14/1953"
        } ]
      """
