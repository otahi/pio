# encoding: utf-8

require 'pio'

describe Pio::Echo::Request do
  describe '.new' do
    context 'with no arguments' do
      When(:echo_request) { Pio::Echo::Request.new }

      Then { echo_request.version == 1 }
      Then { echo_request.message_type == Pio::Echo::REQUEST }
      Then { echo_request.message_length == 8 }
      Then { echo_request.transaction_id == 0 }
      Then { echo_request.xid == 0 }
      Then { echo_request.data == '' }
      Then { echo_request.to_binary == [1, 2, 0, 8, 0, 0, 0, 0].pack('C*') }
    end

    context 'with 123' do
      When(:echo_request) { Pio::Echo::Request.new(123) }

      Then { echo_request.version == 1 }
      Then { echo_request.message_type == Pio::Echo::REQUEST }
      Then { echo_request.message_length == 8 }
      Then { echo_request.transaction_id == 123 }
      Then { echo_request.xid == 123 }
      Then { echo_request.data == '' }
      Then { echo_request.to_binary == [1, 2, 0, 8, 0, 0, 0, 123].pack('C*') }
    end

    context 'with 2**32' do
      When(:result) { Pio::Echo::Request.new(2**32) }

      Then do
        pending 'check if xid is within 32bit range.'
        result == Failure(ArgumentError)
      end
    end

    context 'with transaction_id: 123' do
      When(:echo_request) { Pio::Echo::Request.new(transaction_id: 123) }

      Then { echo_request.version == 1 }
      Then { echo_request.message_type == Pio::Echo::REQUEST }
      Then { echo_request.message_length == 8 }
      Then { echo_request.transaction_id == 123 }
      Then { echo_request.xid == 123 }
      Then { echo_request.data == '' }
      Then { echo_request.to_binary == [1, 2, 0, 8, 0, 0, 0, 123].pack('C*') }
    end

    context 'with xid: 123' do
      When(:echo_request) { Pio::Echo::Request.new(xid: 123) }

      Then { echo_request.version == 1 }
      Then { echo_request.message_type == Pio::Echo::REQUEST }
      Then { echo_request.message_length == 8 }
      Then { echo_request.transaction_id == 123 }
      Then { echo_request.xid == 123 }
      Then { echo_request.data == '' }
      Then { echo_request.to_binary == [1, 2, 0, 8, 0, 0, 0, 123].pack('C*') }
    end

    context "with transaction_id: 123, data: 'foobar'" do
      When(:echo_request) { Pio::Echo::Request.new(xid: 123, data: 'foobar') }

      Then { echo_request.version == 1 }
      Then { echo_request.message_type == Pio::Echo::REQUEST }
      Then { echo_request.message_length == 14 }
      Then { echo_request.transaction_id == 123 }
      Then { echo_request.xid == 123 }
      Then { echo_request.data == 'foobar' }
      Then do
        echo_request.to_binary ==
          [1, 2, 0, 14, 0, 0, 0, 123, 102, 111, 111, 98, 97, 114].pack('C*')
      end
    end

    context 'with :INVALID_ARGUMENT' do
      When(:result) { Pio::Echo::Request.new(:INVALID_ARGUMENT) }

      Then { result == Failure(TypeError) }
    end
  end
end
