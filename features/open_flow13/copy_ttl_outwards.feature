@open_flow13
Feature: Pio::CopyTtlOutwards

  Copies TTL "outwards" -- from next-to-outermost to outermost

  Scenario: new
    When I try to create an OpenFlow action with:
      """
      Pio::CopyTtlOutwards.new
      """
    Then it should finish successfully
    And the action has the following fields and values:
      | field       | value |
      | action_type |    11 |
