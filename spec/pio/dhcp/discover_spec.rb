require 'pio'

describe Pio::DHCP::Discover do
  Then { Pio::DHCP::Discover == Pio::Dhcp::Discover }
end

describe Pio::Dhcp::Discover, '.new' do
  context 'with :transaction_id' do
    subject do
      Pio::Dhcp::Discover.new(
        source_mac: source_mac,
        transaction_id: 0xdeadbeef
      )
    end

    dhcp_discover_dump =
      [
        # Destination MAC Address
        0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
        # Source MAC Address
        0x24, 0xdb, 0xac, 0x41, 0xe5, 0x5b,
        # Ethernet Type
        0x08, 0x00,
        # IP version and IP Header Length
        0x45,
        # DSCP
        0x00,
        # IP Total Length
        0x01, 0x48,
        # IP Identifier
        0x00, 0x00,
        # IP Flags and IP Fragmentation
        0x00, 0x00,
        # IP TTL
        0x80,
        # IP Protocol
        0x11,
        # IP Header Checksum
        0x39, 0xa6,
        # IP Source Address
        0x00, 0x00, 0x00, 0x00,
        # IP Destination Address
        0xff, 0xff, 0xff, 0xff,
        # UDP Source Port
        0x00, 0x44,
        # UDP Destination Port
        0x00, 0x43,
        # UDP Total Length
        0x01, 0x34,
        # UDP Header Checksum
        0x88, 0x14,
        # Bootp Msg Type
        0x01,
        # Hw Type
        0x01,
        # Hw Address Length
        0x06,
        # Hops
        0x00,
        # Transaction ID
        0xde, 0xad, 0xbe, 0xef,
        # Seconds
        0x00, 0x00,
        # Bootp Flags
        0x00, 0x00,
        # Client IP Address
        0x00, 0x00, 0x00, 0x00,
        # Your IP Address
        0x00, 0x00, 0x00, 0x00,
        # Next Server IP Address
        0x00, 0x00, 0x00, 0x00,
        # Relay Agent IP Address
        0x00, 0x00, 0x00, 0x00,
        # Client MAC Address
        0x24, 0xdb, 0xac, 0x41, 0xe5, 0x5b,
        # Client Hw Address Padding
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        # Server Host Name
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        # Boot File Name
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        # Magic Cookie
        0x63, 0x82, 0x53, 0x63,
        # DHCP Msg Type
        0x35, 0x01, 0x01,
        # Client Identifier
        0x3d, 0x07, 0x01, 0x24, 0xdb, 0xac, 0x41, 0xe5, 0x5b,
        # Requested IP Address
        0x32, 0x04, 0x00, 0x00, 0x00, 0x00,
        # Parameter Lists
        0x37, 0x04, 0x01, 0x03, 0x06, 0x2a,
        # End Option
        0xff,
        # Padding Field
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
      ]

    context 'with MAC object Address' do
      let(:source_mac) { Pio::Mac.new('24:db:ac:41:e5:5b') }

      context '#to_binary' do
        it 'returns a DHCP discover binary string' do
          expect(subject.to_binary.unpack('C*')).to eq dhcp_discover_dump
        end

        it 'returns a valid ether frame with size = 342' do
          expect(subject.to_binary.size).to eq 342
        end
      end
    end

    context 'with String MAC Address' do
      let(:source_mac) { '24:db:ac:41:e5:5b' }

      context '#to_binary' do
        it 'returns a DHCP discover binary string' do
          expect(subject.to_binary.unpack('C*')).to eq dhcp_discover_dump
        end

        it 'returns a valid ether frame with size = 342' do
          expect(subject.to_binary.size).to eq 342
        end
      end
    end
  end

  context 'without :transaction_id' do
    subject do
      Pio::Dhcp::Discover.new(source_mac: '24:db:ac:41:e5:5b')
    end

    describe '#transaction_id' do
      it 'returns a valid randomized DHCP Transaction ID' do
        expect(subject.transaction_id).to be_between(0, 0xffffffff)
      end
    end
  end
end
