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
