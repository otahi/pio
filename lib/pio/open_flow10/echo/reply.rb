require 'pio/open_flow/message'

module Pio
  module OpenFlow10
    # OpenFlow 1.0 Echo Request and Reply message.
    module Echo
      # OpenFlow 1.0 Echo Reply message.
      class Reply < OpenFlow::Message
        open_flow_header version: 1, type: 3
        string :body, read_length: -> { length - header_length }

        alias user_data body
      end
    end
  end
end
