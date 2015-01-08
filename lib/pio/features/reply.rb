require 'bindata'
require 'pio/open_flow'

module Pio
  # OpenFlow 1.0 Features messages
  class Features
    # OpenFlow 1.0 Features Reply message
    class Reply < OpenFlow::Message.factory(OpenFlow::Type::FEATURES_REPLY)
      # Message body of features reply.
      class ReplyBody < BinData::Record
        extend Flags

        # enum ofp_capabilities
        def_flags :capabilities,
                  [:flow_stats,
                   :table_stats,
                   :port_stats,
                   :stp,
                   :reserved,
                   :ip_reasm,
                   :queue_stats,
                   :arp_match_ip]

        # enum ofp_action_type
        def_flags :actions_flag,
                  [:output,
                   :set_vlan_vid,
                   :set_vlan_pcp,
                   :strip_vlan,
                   :set_dl_src,
                   :set_dl_dst,
                   :set_nw_src,
                   :set_nw_dst,
                   :set_nw_tos,
                   :set_tp_src,
                   :set_tp_dst,
                   :enqueue]

        endian :big

        uint64 :datapath_id
        uint32 :n_buffers
        uint8 :n_tables
        uint24 :padding
        hide :padding
        capabilities :capabilities
        actions_flag :actions
        array :ports, type: :phy_port, read_until: :eof

        def empty?
          false
        end

        def length
          24 + ports.to_binary_s.length
        end
      end

      def_delegators :body, :datapath_id
      def_delegator :body, :datapath_id, :dpid
      def_delegators :body, :n_buffers
      def_delegators :body, :n_tables
      def_delegators :body, :capabilities
      def_delegators :body, :actions
      def_delegators :body, :ports
    end
  end
end
