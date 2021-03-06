require 'pio/open_flow/action'
require 'pio/type/mac_address'

module Pio
  module OpenFlow10
    # An action to modify the destination Ethernet address of a packet.
    class SetDestinationMacAddress < OpenFlow::Action
      action_header action_type: 5, action_length: 16
      mac_address :mac_address
      string :padding, length: 6
      hide :padding

      def initialize(mac_address)
        super mac_address: mac_address
      end
    end
  end
end
