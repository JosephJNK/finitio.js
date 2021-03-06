Feature: RelationType

  Background:

    Given the System is
      """
      Age  = Integer( i | i>=0 )
      Info = {{ name: String, age: Age }}
      """

  Scenario: Dressing a valid tuple

    Given I dress JSON's '[{ "name": "Finitio", "age": 1 }]' with Info
    Then the result should be a representation for Info

  Scenario: Dressing when an invalid tuple

    Given I dress JSON's '[{ "name": "Finitio" }]' with Info
    Then it should be a TypeError
    And its root cause should be:
      | message                 |
      | Missing attribute `age` |

  Scenario: Dressing in presence of duplicates

    Given I dress the following JSON document with Info:
      """
      [{ "name": "Finitio", "age": 1 },
       { "name": "Finitio", "age": 1 }]
      """
    Then it should be a TypeError
    And its root cause should be:
      | message                                       |
      | Duplicate Tuple: `{"name":"Finitio","age":1}` |
    