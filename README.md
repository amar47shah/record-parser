record-parser
=============

Command-line data parser with web API.
Specification: http://reverb.com/page/dev-challenge

Command Line
------------
`$ bin/record-parser <instruction> <files>`
* Allowed instructions:
  - `birth-date`
  - `gender-and-last-name`
  - `last-name-descending`
* Either a single file or a list of files, separated by spaces, is allowed.

API
---
* Create a record from a new data line: `POST /records`
  - The parameter `line` represents the data line
  - Allowed formats:
    + `LastName FirstName Gender FavoriteColor DateOfBirth`
    + `LastName, FirstName, Gender, FavoriteColor, DateOfBirth`
    + `LastName | FirstName | Gender | FavoriteColor | DateOfBirth`
* List sorted records as JSON:
  - `GET /records/gender`
  - `GET /records/birthdate`
  - `GET /records/name`

Assumptions
-----------
* Each data line in a file ends with a newline character.
* Each record can have only one gender.
  - Possible genders are limited to feminine ('F') and non-feminine (any other).
* Dates appear as M/D/YYYY:
  - 2/15/2012 instead of 02/15/2012, 2/15/12, or Feb 15, 2012
  - 10/9/1940 instead of 10/09/40, 9/10/40, or 9-10-1940
* Sorting is case-sensitive and 'ASCIIbetical':
  - http://blog.codinghorror.com/sorting-for-humans-natural-sort-order/
