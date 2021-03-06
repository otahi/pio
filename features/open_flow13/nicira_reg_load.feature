@open_flow13
Feature: NiciraRegLoad

  Copies value[0:n_bits] to destination[ofs:ofs+n_bits], where a[b:c]
  denotes the bits within 'a' numbered 'b' through 'c' (not including bit 'c').

  Scenario: new(0xdeadbeef, :reg0)
    When I create an OpenFlow action with:
      """
      Pio::NiciraRegLoad.new(0xdeadbeef, :reg0)
      """
    Then the action has the following fields and values:
      | field        |      value |
      | offset       |          0 |
      | n_bits       |         32 |
      | destination  |      :reg0 |
      | value.to_hex | 0xdeadbeef |

  Scenario: new(0xdeadbeef, :metadata)
    When I create an OpenFlow action with:
      """
      Pio::NiciraRegLoad.new(0xdeadbeef, :metadata)
      """
    Then the action has the following fields and values:
      | field        |      value |
      | offset       |          0 |
      | n_bits       |         64 |
      | destination  |  :metadata |
      | value.to_hex | 0xdeadbeef |

  Scenario: new(0xdeadbeef, :reg0, offset: 16, n_bits: 16)
    When I create an OpenFlow action with:
      """
      Pio::NiciraRegLoad.new(0xdeadbeef, :reg0, offset: 16, n_bits: 16)
      """
    Then the action has the following fields and values:
      | field        |      value |
      | offset       |         16 |
      | n_bits       |         16 |
      | destination  |      :reg0 |
      | value.to_hex | 0xdeadbeef |
