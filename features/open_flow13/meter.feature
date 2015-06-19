Feature: Pio::Meter
  Background:
    Given I use OpenFlow 1.3

  Scenario: new(1)
    When I try to create an OpenFlow instruction with:
    """
    Pio::Meter.new(1)
    """
    Then it should finish successfully
    And the message have the following fields and values:
    | field              |      value |
    | class              | Pio::Meter |
    | instruction_type   |          6 |
    | instruction_length |          8 |
    | meter_id           |          1 |

  Scenario: read
    When I try to parse a file named "open_flow13/instruction_meter.raw" with "Pio::Meter" class
    Then it should finish successfully
    And the message have the following fields and values:
      | field              |      value |
      | class              | Pio::Meter |
      | instruction_type   |          6 |
      | instruction_length |          8 |
      | meter_id           |          1 |