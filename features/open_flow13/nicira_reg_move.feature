@open_flow13
Feature: Pio::NiciraRegMove

  Scenario: new(from: :arp_sender_hardware_address, to: :arp_target_hardware_address)
    When I try to create an OpenFlow action with:
      """
      Pio::NiciraRegMove.new(from: :arp_sender_hardware_address, to: :arp_target_hardware_address)
      """
    Then it should finish successfully
    And the action has the following fields and values:
      | field                  |                        value |
      | action_type.to_hex     |                       0xffff |
      | action_length          |                           16 |
      | experimenter_id.to_hex |                       0x2320 |
      | experimenter_type      |                            6 |
      | from                   | :arp_sender_hardware_address |
      | source_oxm_field       |                           24 |
      | source_oxm_length      |                            6 |
      | to                     | :arp_target_hardware_address |
      | destination_oxm_field  |                           25 |
      | destination_oxm_length |                            6 |
