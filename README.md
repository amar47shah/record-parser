record-parser
=============

Command-line data parser. Specification: http://reverb.com/page/dev-challenge

Current Assumptions
-------------------
* Only one file is input per execution.
* Each record ends with a newline character.
* Each record can have only one gender.
* Possible genders are limited to feminine and non-feminine.
* Feminine gender is signified with value 'F'.
* Non-feminine gender is signified with any value other than 'F'.
* Dates appear as M/D/YYYY:
  - 2/15/2012 instead of 02/15/2012, 2/15/12, or Feb 15, 2012
  - 10/9/1940 instead of 10/09/40, 9/10/40, or 9-10-1940
* Sorting is case-sensitive and 'ASCIIbetical':
  http://blog.codinghorror.com/sorting-for-humans-natural-sort-order/
